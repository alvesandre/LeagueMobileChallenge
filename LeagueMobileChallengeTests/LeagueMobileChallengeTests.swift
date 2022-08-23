//
//  LeagueMobileChallengeTests.swift
//  LeagueMobileChallengeTests
//
//  Created by Kelvin Lau on 2019-01-09.
//  Copyright © 2019 Kelvin Lau. All rights reserved.
//

import XCTest
@testable import LeagueMobileChallenge

class LeagueMobileChallengeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHandleError() {
        let viewModel = PostsViewModel(view: PostViewMock())
        let delegate = PostViewModelDelegateMock()
        viewModel.delegate = delegate
        viewModel.handleError(with: APIError.emptyData)
        XCTAssertEqual(delegate.numberOfCallsShowMessage, 1)
    }
    
    func testViewWillAppear() {
        let view = PostsViewController()
        let viewModel = PostViewModelMock()
        view.viewModel = viewModel
        view.viewWillAppear(true)
        XCTAssertEqual(view.title, "Posts")
        XCTAssertEqual(viewModel.numberOfCallsFetchPosts, 1)
    }
    
    func testViewNumberOfRows() {
        let view = PostsViewController()
        let viewModel = PostViewModelMock()
        view.viewModel = viewModel
        _ = view.tableView(UITableView(), numberOfRowsInSection: 0)
        XCTAssertEqual(viewModel.numberOfCallsNumberOfRowsInSection, 1)
    }
    
    func testViewCellForRowAt() {
        let view = PostsViewController()
        let viewModel = PostViewModelMock()
        view.viewModel = viewModel
        _ = view.tableView(UITableView(), cellForRowAt: IndexPath(item: 0, section: 0))
        XCTAssertEqual(viewModel.numberOfCallsCellForRowAt, 1)
    }
    
    func testFetchPosts() {
        let view = PostViewMock()
        view.expectationReloadData = XCTestExpectation(description: "Reload Data")
        let viewModel = PostsViewModel(view: view)
        let delegate = PostViewModelDelegateMock()
        viewModel.delegate = delegate
        viewModel.fetchPosts()
        
        wait(for: [view.expectationReloadData!], timeout: 10)
        XCTAssertEqual(view.numberOfCallsReloadData, 1)
        
    }

}
