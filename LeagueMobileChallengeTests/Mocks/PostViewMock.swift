//
//  PostViewMock.swift
//  LeagueMobileChallengeTests
//
//  Created by André Alves on 23/08/22.
//  Copyright © 2022 Kelvin Lau. All rights reserved.
//

import Foundation
@testable import LeagueMobileChallenge
import XCTest

final class PostViewMock: PostsViewProtocol {
    var expectationReloadData: XCTestExpectation?
    var numberOfCallsReloadData: Int = 0
    var numberOfCallsReloadDataAtRow: Int = 0
    
    func reloadData() {
        expectationReloadData?.fulfill()
        numberOfCallsReloadData += 1
    }
}
