//
//  ViewModel.swift
//  LeagueMobileChallenge
//
//  Created by André Alves on 18/08/22.
//  Copyright © 2022 Kelvin Lau. All rights reserved.
//

import Foundation

// MARK: Protocol Delegate
protocol ViewModelDelegate: class {
    func showMessage(title: String, message: String)
}
