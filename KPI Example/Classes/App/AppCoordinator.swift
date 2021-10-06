//
//  AppCoordinator.swift
//  KPI Example
//
//  Created by Oleksii Filobok on 30.09.2021.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    // MARK: - Properties
    var childs: [Coordinator] = []
    
    private weak var window: UIWindow?
    private let app: App
    
    // MARK: - Init
    init(
        window: UIWindow?,
        app: App
    ) {
        self.window = window
        self.app = app
    }
}

// MARK: - Public
extension AppCoordinator {
    func start() {
        /**
         Достаем значение ABTest-а из инстанса App и в зависимости от значения показиваем нужный нам View Controller
         */
        let safeABTestValue = app.initialScreenABTestValue?.abTestValue ?? .variantA
        let vc: UIViewController
        switch safeABTestValue {
        case .variantA:
            vc = InitialViewControllerA()
        case .variantB:
            vc = InitialViewControllerB()
        }
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}
