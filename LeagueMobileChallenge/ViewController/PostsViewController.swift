//
//  PostsViewController.swift
//  LeagueMobileChallenge
//
//  Created by André Alves on 18/08/22.
//  Copyright © 2022 Kelvin Lau. All rights reserved.
//

import UIKit

protocol PostsViewProtocol: class {
    func reloadData()
}

final class PostsViewController: UIViewController {
    var viewModel: PostsViewModelProtocol?
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: UIScreen.main.bounds, style: .plain)
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .singleLine
        table.backgroundView?.clipsToBounds = true
        table.backgroundColor = .white
        table.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        
        table.allowsSelection = false
        table.showsVerticalScrollIndicator = false
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Posts"
        self.configureTableView()
        self.viewModel?.fetchPosts()
    }

    private func configureTableView() {
        tableView.dataSource = self
        tableView.register(PostTableViewCell.Constants.CellType, forCellReuseIdentifier: PostTableViewCell.Constants.CellIdentifier)
        
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

// MARK: - PostsViewProtocol

extension PostsViewController: PostsViewProtocol {
    func reloadData() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension PostsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel!.cellForRowAt(with: tableView, for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.numberOfRowsInSection(with: section)
    }
}
