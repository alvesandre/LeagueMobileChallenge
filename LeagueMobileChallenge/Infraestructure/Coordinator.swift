//
//  Coordinator.swift
//  LeagueMobileChallenge
//
//  Created by André Alves on 18/08/22.
//  Copyright © 2022 Kelvin Lau. All rights reserved.
//

import UIKit

fileprivate enum Constants {
    static let OK = "OK"
}

protocol Coordinator {
    var navigation: UINavigationController { get }
    
    init(window: UIWindow)
    
    func start()
    func showAlert(title: String, message: String)
}

extension Coordinator {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: Constants.OK, style: .default)
        alert.addAction(action)
        self.navigation.present(alert, animated: true)
    }
}
