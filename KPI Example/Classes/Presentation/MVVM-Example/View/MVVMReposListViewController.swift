//
//  MVVMReposListViewController.swift
//  KPI Example
//
//  Created by Aleksey Filobok on 05.11.2021.
//

import UIKit

class MVVMReposListViewController: UIViewController {
    private var tableView: UITableView?
    private var activityIndicator: UIActivityIndicatorView?
    
    private let viewModel: MVVMReposListViewModel
    
    init(viewModel: MVVMReposListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        bindEvents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Repos"
        createUI()
        self.viewModel.onViewLoad()
    }

}

// MARK: - Private
extension MVVMReposListViewController {
    private func bindEvents() {
        self.viewModel.onStateUpdate = { [unowned self] state in
            switch state {
            case .idle: ()
            case .loading: self.activityIndicator?.startAnimating()
            case .presented:
                self.activityIndicator?.stopAnimating()
                self.tableView?.reloadData()
            }
        }
    }
    
    private func createUI() {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ri")
        self.view.snap(tableView)
        
        self.tableView = tableView
        
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        self.activityIndicator = activityIndicator
    }
}

// MARK: - UITableViewDataSource
extension MVVMReposListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.cellItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default,
                                   reuseIdentifier: "ri")
        cell.textLabel?.text = self.viewModel.cellItems[indexPath.row].name
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MVVMReposListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: UIView.areAnimationsEnabled)
    }
}
