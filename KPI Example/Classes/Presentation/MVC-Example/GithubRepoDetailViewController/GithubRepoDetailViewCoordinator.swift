//
//  GithubRepoDetailViewCoordinator.swift
//  KPI Example
//
//  Created by Aleksey Filobok on 05.11.2021.
//

import Foundation
import UIKit

final class GithubRepoDetailViewCoordinator: Coordinator {
    // MARK: - Properties
    var childs: [Coordinator] = []
    private let rootViewController: UIViewController
    private let detailViewController: GithubRepoDetailViewController
    
    // MARK: - Init
    init(
        rootViewController: UIViewController,
        repoCellItem: RepoCellItem
    ) {
        self.rootViewController = rootViewController
        self.detailViewController = .init(repoItem: repoCellItem)
    }
}

// MARK: - Public
extension GithubRepoDetailViewCoordinator {
    func start() {
        self.rootViewController.show(detailViewController, sender: self)
    }
}
