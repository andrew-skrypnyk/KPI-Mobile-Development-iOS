//
//  GithubRepoDetailView.swift
//  KPI Example
//
//  Created by Aleksey Filobok on 05.11.2021.
//

import UIKit

final class GithubRepoDetailView: UIView {
    private var titleLabel: UILabel?
    private var descriptionLabel: UILabel?
    
    init() {
        super.init(frame: .zero)
        createUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public
extension GithubRepoDetailView {
    func update(with repoItem: RepoCellItem) {
        self.titleLabel?.text = repoItem.name
        self.descriptionLabel?.text = repoItem.description
    }
}

// MARK: - Private
extension GithubRepoDetailView {
    private func createUI() {
        self.backgroundColor = .white
        
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.distribution = .fillProportionally
        self.snap(vStack)
        
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        vStack.addArrangedSubview(titleLabel)
        self.titleLabel = titleLabel
        
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 12)
        descriptionLabel.textAlignment = .center
        vStack.addArrangedSubview(descriptionLabel)
        self.descriptionLabel = descriptionLabel
    }
}
