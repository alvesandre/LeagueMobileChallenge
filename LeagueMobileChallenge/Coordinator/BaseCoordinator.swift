//
//  BaseCoordinator.swift
//  LeagueMobileChallenge
//
//  Created by André Alves on 18/08/22.
//  Copyright © 2022 Kelvin Lau. All rights reserved.
//

import UIKit

final class BaseCoordinator: Coordinator {
    
    let window: UIWindow
    
    var navigation: UINavigationController = UINavigationController()
    
    init(window: UIWindow) {
        self.window = window
        window.rootViewController = navigation
        window.backgroundColor = UIColor.white
        window.makeKeyAndVisible()
    }
    
    func start() {
        let view = PostsViewController()
        let viewModel = PostsViewModel(view: view)
        viewModel.delegate = self
        view.viewModel = viewModel
        
        self.navigation.pushViewController(viewModel.view as! UIViewController, animated: true)
    }
}

// MARK: - ViewModelDelegate

extension BaseCoordinator: ViewModelDelegate {
    func showMessage(title: String, message: String) {
        self.showAlert(title: title, message: message)
    }
}
