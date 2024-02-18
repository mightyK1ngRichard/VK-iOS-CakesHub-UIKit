//
//  AppCoordinator.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 03/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

final class AppCoordinator: BaseCoordinator {

    var window: UIWindow
    var navigationController = UINavigationController()
    private var isAuth = true

    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }

    override func start() {
        if isAuth {
            openMainViewController()
        } else {
            openLoginViewController()
        }
    }
}

// MARK: - Private Methods

private extension AppCoordinator {

    func openMainViewController() {
        let coordinator = MainViewControllerCoordinator(navigationController: navigationController)
        add(coordinator)
        coordinator.start()
    }

    func openLoginViewController() {
        // TODO: Добавить экран авторазации
    }
}
