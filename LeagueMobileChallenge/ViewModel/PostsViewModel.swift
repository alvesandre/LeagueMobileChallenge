//
//  PostsViewModel.swift
//  LeagueMobileChallenge
//
//  Created by André Alves on 18/08/22.
//  Copyright © 2022 Kelvin Lau. All rights reserved.
//

import Foundation
import UIKit
protocol PostsViewModelProtocol: class {
    func fetchPosts()
    func numberOfRowsInSection(with section: Int) -> Int
    func cellForRowAt(with tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell
}

final class PostsViewModel {
    weak var delegate: ViewModelDelegate?
    
    var view: PostsViewProtocol?
    
    private var posts: [Post] = []
    private var users: [User] = []
    
    init(view: PostsViewProtocol) {
        self.view = view
    }
    
    func handleError(with error: Error) {
        delegate?.showMessage(title: "Error", message: error.localizedDescription)
    }
}

extension PostsViewModel: PostsViewModelProtocol {
    private func fetchUserToken() {
        API.shared.fetchUserToken { result in
            switch result {
            case .success(let userToken):
                print(userToken)
                self.fetchUsers()
            case .failure(let error):
                self.handleError(with: error)
            }
        }
    }
    
    private func fetchUsers() {
        API.shared.fetchUsers { result in
            switch result {
            case .success(let users):
                self.users = users
                self.fetchAllPosts()
            case .failure(let error):
                self.handleError(with: error)
            }
        }
    }
    
    private func fetchAllPosts() {
        API.shared.fetchPosts { result in
            switch result {
            case .success(let posts):
                self.posts = posts
                for post in self.posts {
                    guard let index = self.posts.firstIndex(where: {$0.id == post.id}) else {
                        return
                    }
                    self.posts[index].user = self.users.first(where: {$0.id == post.userId})
                }
                self.view?.reloadData()
            case .failure(let error):
                self.handleError(with: error)
            }
        }
    }
    
    func fetchPosts() {
        self.fetchUserToken()
    }
    
    func numberOfRowsInSection(with section: Int) -> Int {
        return self.posts.count
    }
    
    func cellForRowAt(with tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.Constants.CellIdentifier, for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(with: posts[indexPath.row])
        
        return cell
    }
    
}

