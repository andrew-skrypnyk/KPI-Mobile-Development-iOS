//
//  ABTestWrapper.swift
//  KPI Example
//
//  Created by Oleksii Filobok on 06.10.2021.
//

import Foundation

enum ABTestCodingKeys: String, CodingKey {
    case key
    case value
}

enum ValidationError: Error { case wrongRawValue }

final class ABTestWrapper<A: ABTestProtocol>: Encodable where A.RawValue == String {
    
    typealias ABTestType = A
    let abTestValue: A
    
    init(_ abTest: A) {
        self.abTestValue = abTest
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(coder:) has not been implemented")
    }
    
    func encode(to encoder: Encoder) throws {
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: ABTestCodingKeys.self)
            try container.encode(A.analyticsIdentifier, forKey: .key)
            try container.encode(self.abTestValue.rawValue, forKey: .value)
        }
    }
}
