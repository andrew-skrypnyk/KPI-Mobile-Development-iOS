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
        showReposList()
    }
}

// MARK: - Private
extension AppCoordinator {
    private func showReposList() {
        let reposListCoordinator = GithubReposListViewCoordinator(window: self.window)
        addChild(reposListCoordinator)
        reposListCoordinator.start()
    }
}
