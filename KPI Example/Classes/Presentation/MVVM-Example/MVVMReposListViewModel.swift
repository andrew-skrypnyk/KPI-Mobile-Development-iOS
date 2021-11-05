//
//  MVVMReposListViewModel.swift
//  KPI Example
//
//  Created by Aleksey Filobok on 05.11.2021.
//

import Foundation

enum MVVMReposListViewState {
    case idle
    case loading
    case presented
}

final class MVVMReposListViewModel {
    var onStateUpdate: ((MVVMReposListViewState) -> Void)?
    private var reposViewState: MVVMReposListViewState = .idle {
        didSet {
            onStateUpdate?(reposViewState)
        }
    }
    private(set) var cellItems: [RepoCellItem] = []
}

// MARK: - Public
extension MVVMReposListViewModel {
    func onViewLoad() {
        self.reposViewState = .loading
        GithubAPI.searchRepos(query: "mvvm") { [unowned self] in
            self.cellItems = $0.map { RepoCellItem(name: $0.name, description: $0.description ?? "No description!") }
            self.reposViewState = .presented
        }
    }
}
