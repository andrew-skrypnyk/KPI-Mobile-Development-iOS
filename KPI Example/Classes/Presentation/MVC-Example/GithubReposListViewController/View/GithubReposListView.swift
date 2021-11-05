//
//  GithubReposListView.swift
//  KPI Example
//
//  Created by Aleksey Filobok on 05.11.2021.
//

import UIKit

enum GithubReposListViewState {
    case idle
    case loading
    case presenting(repos: [RepoCellItem])
}

struct RepoCellItem {
    let name: String
    let description: String
}

final class GithubReposListView: UIView {
    private var tableView: UITableView?
    private var activityIndicator: UIActivityIndicatorView?
    private var items: [RepoCellItem] = []
    private var state: GithubReposListViewState = .idle {
        didSet {
            updateUI(for: state)
        }
    }
    
    var onSelectRepoCellItem: ((RepoCellItem) -> Void)?
    
    init() {
        super.init(frame: .zero)
        createUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public
extension GithubReposListView {
    func update(state: GithubReposListViewState) {
        self.state = state
    }
}

// MARK: - Private
extension GithubReposListView {
    private func createUI() {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ri")
        self.snap(tableView)
        
        self.tableView = tableView
        
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        self.activityIndicator = activityIndicator
    }
    
    private func updateUI(for state: GithubReposListViewState) {
        switch state {
        case .idle: ()
        case .loading:
            self.activityIndicator?.startAnimating()
        case .presenting(let repos):
            self.items = repos
            self.activityIndicator?.stopAnimating()
            self.tableView?.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource
extension GithubReposListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default,
                                   reuseIdentifier: "ri")
        cell.textLabel?.text = items[indexPath.row].name
        return cell
    }
}

// MARK: - UITableViewDelegate
extension GithubReposListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.items[indexPath.row]
        onSelectRepoCellItem?(item)
        tableView.deselectRow(at: indexPath, animated: UIView.areAnimationsEnabled)
    }
}
