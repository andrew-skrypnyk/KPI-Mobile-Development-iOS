//
//  GithubReposListViewCoordinator.swift
//  KPI Example
//
//  Created by Aleksey Filobok on 05.11.2021.
//

import Foundation
import UIKit

final class GithubReposListViewCoordinator: Coordinator {
    // MARK: - Properties
    var childs: [Coordinator] = []
    
    private weak var window: UIWindow?
    private let reposListViewController: GithubReposListViewController = .init()
    
    // MARK: - Init
    init(
        window: UIWindow?
    ) {
        self.window = window
        bindCallbacks()
    }
}

// MARK: - Public
extension GithubReposListViewCoordinator {
    func start() {
        let navigationViewController = UINavigationController(rootViewController: self.reposListViewController)
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
    }
}

// MARK: - Private
extension GithubReposListViewCoordinator {
    private func bindCallbacks() {
        self.reposListViewController.onSelectRepoCellItem = { [unowned self] cellItem in
            self.showRepoDetail(for: cellItem)
        }
    }
    
    private func showRepoDetail(for cellItem: RepoCellItem) {
        let detailCoordinator = GithubRepoDetailViewCoordinator(rootViewController: reposListViewController,
                                                                repoCellItem: cellItem)
        detailCoordinator.start()
    }
}
