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
    
    var initialScreenABTestValue: ABTestWrapper<InitialScreenABTest>?
    
    init(
        application: UIApplication,
        abTestsService: ABTestsServiceProtocol
    ) {
        self.application = application
        self.abTestsService = abTestsService
        
        self.initialScreenABTestValue = abTestsService.fetchABTest(type: InitialScreenABTest.self)
    }
}
