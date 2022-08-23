//
//  PostViewModelMock.swift
//  LeagueMobileChallengeTests
//
//  Created by André Alves on 23/08/22.
//  Copyright © 2022 Kelvin Lau. All rights reserved.
//

import UIKit
@testable import LeagueMobileChallenge

final class PostViewModelMock: PostsViewModelProtocol {
    var delegate: ViewModelDelegate? = PostViewModelDelegateMock()
    var numberOfCallsFetchPosts: Int = 0
    var numberOfCallsNumberOfRowsInSection: Int = 0
    var numberOfCallsCellForRowAt: Int = 0
    
    func fetchPosts() {
        numberOfCallsFetchPosts += 1
    }
    
    func numberOfRowsInSection(with section: Int) -> Int {
        numberOfCallsNumberOfRowsInSection += 1
        return 1
    }
    
    func cellForRowAt(with tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        numberOfCallsCellForRowAt += 1
        return UITableViewCell()
    }
    
}
