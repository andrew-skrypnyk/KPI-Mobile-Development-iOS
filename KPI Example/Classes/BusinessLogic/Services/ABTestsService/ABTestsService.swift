//
//  ABTestsService.swift
//  KPI Example
//
//  Created by Oleksii Filobok on 30.09.2021.
//

import Foundation
import UIKit

struct PureABTestStorageValue: Codable, Hashable, Equatable {
    let analyticsValue: String
    let rawValue: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(analyticsValue)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool { lhs.hashValue == rhs.hashValue }
}

final class ABTestsService: ABTestsServiceProtocol {
    // MARK: - Properties
    private let analytics: AnalyticsServiceProtocol
    private var localStorage: Set<PureABTestStorageValue>
    
    init(
        analytics: AnalyticsServiceProtocol,
        localStorage: Set<PureABTestStorageValue>
    ) {
        self.analytics = analytics
        self.localStorage = localStorage
    }
    
    /**
        Функция, которая отправляет значение ABTest-а во все аналитические тулзы и устанавливает User Property
     */
    func hitSplitTest<T: ABTestProtocol>(abTest: ABTestWrapper<T>) where T.RawValue == String {
        let event = AnalyticEvent(identifier: T.analyticsIdentifier,
                                  parameters: ["param": abTest.abTestValue.rawValue])
        analytics.track(event: event)
        analytics.setUserProperties(name: Constants.userPropertiesIdentifier + T.analyticsIdentifier, value: abTest.abTestValue.rawValue)
    }
  
    /**
     Функция для получения значения АБ теста с указанной пробабилити в ABTestProtocol
     */
    func fetchABTest<T: ABTestProtocol>(type: T.Type) -> ABTestWrapper<T>? where T.RawValue == String {
        /// If exist we fetch ab test from local storage
        if let abTest = fetchTestFromLocalStorage(type: type) {
            return abTest
        }
        /// Otherwise generate value for ab test
        let abTestRawValue = generateABTestLocally(type: type)
        
        guard let abTest = T.init(rawValue: abTestRawValue) else { return nil }
        
        let wrapper = ABTestWrapper<T>(abTest)
        /// Store value then send to all analytics services
        saveTestToLocalStorage(test: wrapper)
        hitSplitTest(abTest: wrapper)
        
        return wrapper
    }
}

// MARK: - Private
extension ABTestsService {
    /**
     Generate ABTest value locally with prefined probabilities
     */
    private func generateABTestLocally<T: ABTestProtocol>(type: T.Type) -> String where T.RawValue == String {
        var allCases = type.allCases.map {
            return (rawValue: $0.rawValue, probability: abs($0.probability))
        }
        let total = allCases.map { type in
            return type.probability
        }.reduce(0, +)
        
        guard total > 0 else {
            return allCases.randomElement()?.rawValue ?? ""
        }
        
        let random = Double.random(in: 0.0...1.0)
        allCases = allCases.map {
            return (rawValue: $0.rawValue, probability: $0.probability / total)
        }
        
        var summ: Double = 0.0
        for index in allCases {
            summ += index.probability
            guard summ < random else {
                return index.rawValue
            }
        }
        return allCases.randomElement()?.rawValue ?? ""
    }
    /**
     Saving ABTest value to local storage
     */
    private func saveTestToLocalStorage<T: ABTestProtocol>(test: ABTestWrapper<T>) where T.RawValue == String {
        self.localStorage.update(with: .init(analyticsValue: T.analyticsIdentifier, rawValue: test.abTestValue.rawValue))
    }
    
    /**
     Fetch ABTest value from remote storage
     */
    private func fetchTestFromLocalStorage<T: ABTestProtocol>(type: T.Type) -> ABTestWrapper<T>? where T.RawValue == String {
        guard let saved = self.localStorage.first(where: { $0.analyticsValue == T.analyticsIdentifier }),
              let abTest = T.init(rawValue: saved.rawValue) else { return nil }

        return ABTestWrapper<T>(abTest)
    }
}

// MARK: - Constants
private enum Constants {
    static let userPropertiesIdentifier = "[ab test]"
}
