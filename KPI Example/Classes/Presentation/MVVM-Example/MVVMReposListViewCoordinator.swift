//
//  MVVMReposListViewCoordinator.swift
//  KPI Example
//
//  Created by Aleksey Filobok on 05.11.2021.
//

import Foundation
import UIKit

final class MVVMReposListViewCoordinator: Coordinator {
    // MARK: - Properties
    var childs: [Coordinator] = []
    
    private weak var window: UIWindow?
    private let mvvmReposListViewController: MVVMReposListViewController = .init(viewModel: .init())
    
    // MARK: - Init
    init(
        window: UIWindow?
    ) {
        self.window = window
    }
}

// MARK: - Public
extension MVVMReposListViewCoordinator {
    func start() {
        let navigationViewController = UINavigationController(rootViewController: self.mvvmReposListViewController)
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
    }
}
