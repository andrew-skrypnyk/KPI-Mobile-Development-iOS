//
//  AnalyticsService.swift
//  KPI Example
//
//  Created by Oleksii Filobok on 30.09.2021.
//

import Foundation
//import Amplitude_iOS
//import AppCenterAnalytics
//import FirebaseAnalytics
//import Firebase

final class AnalyticsService: AnalyticsServiceProtocol {
    func enable() {
//        configureAppCenter()
//        configureAmplitude()
//        configureFirebase()
    }
    
    func track(event: AnalyticEvent) {
//        Analytics.logEvent(event.identifier, parameters: event.parameters)
//        Amplitude.instance()?.logEvent(event.identifier, withEventProperties: event.parameters)
//        AppCenterAnalytics.Analytics.trackEvent(event.identifier, withProperties: event.parameters)
//        FirebaseAnalytics.Analytics.logEvent(event.identifier, parameters: event.parameters)
    }
    
    func setUserProperties(name: String, value: String) {
//        Amplitude.instance()?.setUserProperties([name: value])
    }
}

// MARK: - Private
extension AnalyticsService {
    private func configureAmplitude() {
//        Amplitude.instance()?.useAdvertisingIdForDeviceId()
//        Amplitude.instance()?.initializeApiKey("amplitude_api_key")
    }
    
    private func configureAppCenter() {
//        let services = [AppCenterAnalytics.Analytics.self]
//        AppCenter.start(withAppSecret: "app_center_api_key",
//                        services: services)
    }
    
    private func configureFirebase() {
//        FirebaseApp.configure()
    }
}
