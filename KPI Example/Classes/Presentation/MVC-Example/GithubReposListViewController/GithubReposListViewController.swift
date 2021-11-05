//
//  GithubReposListViewController.swift
//  KPI Example
//
//  Created by Aleksey Filobok on 05.11.2021.
//

import UIKit

final class GithubReposListViewController: ViewLoadableController<GithubReposListView> {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Repos"

        self.mainView.onSelectRepoCellItem = { [unowned self] cellItem in
            let detailRepoViewController = GithubRepoDetailViewController(repoItem: cellItem)
            self.navigationController?.pushViewController(detailRepoViewController,
                                                          animated: UIView.areAnimationsEnabled)
        }
        
        fetchRepositories()
    }
}

// MARK: - Private
extension GithubReposListViewController {
    private func fetchRepositories() {
        self.mainView.update(state: .loading)
        GithubAPI.searchRepos(query: "swift") { [unowned self] items in
            self.mainView.update(state: .presenting(repos: items.map { RepoCellItem(name: $0.name,
                                                                                    description: $0.description ?? "No descritpion") }))
        }
    }
}
