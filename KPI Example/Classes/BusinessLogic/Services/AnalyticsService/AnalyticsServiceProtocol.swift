//
//  AnalyticsServiceProtocol.swift
//  KPI Example
//
//  Created by Oleksii Filobok on 30.09.2021.
//

import Foundation

protocol AnalyticsServiceProtocol {
    func enable()
    func track(event: AnalyticEvent)
    func setUserProperties(name: String, value: String)
}
