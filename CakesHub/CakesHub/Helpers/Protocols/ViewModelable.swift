//
//  ViewModelable.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 02/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import Foundation

/// View controller protocol
protocol ViewModelable {
    associatedtype ViewModelType: ViewModelProtocol

    var viewModel: ViewModelType { get set }
}
