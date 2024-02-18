//
//  BaseCoordinator.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 03/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import Foundation

class BaseCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []

    func start() { fatalError("Каждый наследний должен реализовать этот метод") }
}
