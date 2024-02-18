//
//  CHMProfileButtonsBlock+HandlerConfiguration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 02/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//


import Foundation

public extension CHMProfileButtonsBlock {

    struct HandlerConfiguration: ClearConfigurationProtocol {

        /// Handler to detect when image hit
        public var imageTapHandler: CHMViewBlock<CHMIconTextView>?
    }
}

// MARK: - Clear Handler Configuration

public extension CHMProfileButtonsBlock.HandlerConfiguration {

    /// Default clear handler configuration
    static let clear = CHMProfileButtonsBlock.HandlerConfiguration()
}
