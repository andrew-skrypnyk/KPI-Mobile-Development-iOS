//
//  GithubRepoDetailViewController.swift
//  KPI Example
//
//  Created by Aleksey Filobok on 05.11.2021.
//

import UIKit

final class GithubRepoDetailViewController: ViewLoadableController<GithubRepoDetailView> {
    private let repoItem: RepoCellItem
    
    init(repoItem: RepoCellItem) {
        self.repoItem = repoItem
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.update(with: repoItem)
    }
}


