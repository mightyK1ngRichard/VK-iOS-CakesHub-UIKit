//
//  MainViewControllerCoordinator.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 05.02.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import UIKit

final class MainViewControllerCoordinator: BaseCoordinator {

    private let navigationController: UINavigationController
    #warning("Добавьте ViewModel, если это необходимо")

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {
        let mainViewModel = MainViewModel()
        let vc = MainViewController(viewModel: mainViewModel)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

//    func openScreen<#NameViewController#>() {
        // let coordinator = <#NameViewController#>Coordinator(navigationController: navigationController)
        // add(coordinator)
        // coordinator.start()
//    }
}
