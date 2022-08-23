//
//  PostViewModelDelegateMock.swift
//  LeagueMobileChallengeTests
//
//  Created by André Alves on 23/08/22.
//  Copyright © 2022 Kelvin Lau. All rights reserved.
//

import Foundation
@testable import LeagueMobileChallenge

final class PostViewModelDelegateMock: ViewModelDelegate {
    var numberOfCallsShowMessage: Int = 0
    func showMessage(title: String, message: String) {
        numberOfCallsShowMessage += 1
    }
    
}
