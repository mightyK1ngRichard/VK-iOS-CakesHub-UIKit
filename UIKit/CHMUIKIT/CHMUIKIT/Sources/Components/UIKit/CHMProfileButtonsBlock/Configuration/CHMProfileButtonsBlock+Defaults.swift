//
//  CHMProfileButtonsBlock+Defaults.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 02/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMProfileButtonsBlock.Configuration {

    /// Basic configuration
    static let clear = CHMProfileButtonsBlock.Configuration()

    /// Basic configuration
    /// - Parameters:
    ///   - configurations: array of icon text configurations
    /// - Returns: configuration of the view
    static func basic(
        configurations: [CHMIconTextView.Configuration]
    ) -> CHMProfileButtonsBlock.Configuration {
        modify(.clear) {
            $0.buttonConfigurations = configurations
        }
    }
}
