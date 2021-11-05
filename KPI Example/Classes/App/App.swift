//
//  App.swift
//  KPI Example
//
//  Created by Oleksii Filobok on 30.09.2021.
//

import Foundation
import UIKit

final class App {
    // MARK: - Properties
    private let application: UIApplication
    private let abTestsService: ABTestsServiceProtocol
    private let analytics: AnalyticsServiceProtocol
    
    var initialScreenABTestValue: ABTestWrapper<InitialScreenABTest>?
    
    init(
        application: UIApplication,
        abTestsService: ABTestsServiceProtocol,
        analytics: AnalyticsServiceProtocol
    ) {
        self.application = application
        self.abTestsService = abTestsService
        self.analytics = analytics
        #if !DEBUG
        analytics.enable()
        #endif
        
        self.initialScreenABTestValue = abTestsService.fetchABTest(type: InitialScreenABTest.self)
    }
}
