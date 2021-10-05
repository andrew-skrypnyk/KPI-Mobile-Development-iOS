//
//  InitialScreenABTest.swift
//  KPI Example
//
//  Created by Oleksii Filobok on 06.10.2021.
//

import Foundation

enum InitialScreenABTest: String, ABTestProtocol {
    static var analyticsIdentifier: String = "ios_initial_screen_abTest"
    var probability: Double { 0.5 }
    
    case variantA
    case variantB
}
