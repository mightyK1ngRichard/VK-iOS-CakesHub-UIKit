//
//  ___VARIABLE_productName:identifier___ViewControllerCoordinator.swift
//  CakesHub
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___YEAR___ © VK Team CakesHub. All rights reserved.
//

import UIKit

final class ___VARIABLE_productName:identifier___ViewControllerCoordinator: BaseCoordinator {

    private let navigationController: UINavigationController
    #warning("Добавьте ViewModel, если это необходимо")

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {
        let vc = ___VARIABLE_productName:identifier___ViewController(viewModel: <#viewModel#>)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

    #warning("Замените логику на ваш view controller")
    func openScreen<#NameViewController#>() {
        // let coordinator = <#NameViewController#>Coordinator(navigationController: navigationController)
        // add(coordinator)
        // coordinator.start()
    }
}
