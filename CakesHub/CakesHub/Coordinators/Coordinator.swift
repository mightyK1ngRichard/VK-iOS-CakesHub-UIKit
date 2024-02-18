//
//  Coordinator.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 03/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
}

extension Coordinator {

    func add(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    func addCoordinators(_ coordinators: Coordinator...) {
        coordinators.forEach {
            childCoordinators.append($0)
        }
    }

    func addCoordinators(_ coordinators: [Coordinator]) {
        coordinators.forEach {
            childCoordinators.append($0)
        }
    }

    func remove(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}
