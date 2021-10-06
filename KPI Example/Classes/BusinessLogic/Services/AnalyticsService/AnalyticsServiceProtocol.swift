//
//  AnalyticsServiceProtocol.swift
//  KPI Example
//
//  Created by Oleksii Filobok on 30.09.2021.
//

import Foundation

protocol AnalyticsServiceProtocol {
    /// Включает и конфигурирует все ааналитические сервисы
    func enable()
    /// Трекает ивент во все аналитические сервисы
    func track(event: AnalyticEvent)
    /// Устанавливает user property в Amplitude
    func setUserProperties(name: String, value: String)
}
