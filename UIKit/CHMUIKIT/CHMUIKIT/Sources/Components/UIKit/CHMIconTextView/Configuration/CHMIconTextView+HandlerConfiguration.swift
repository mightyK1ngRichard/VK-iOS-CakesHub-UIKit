//
//  CHMIconTextView+HandlerConfiguration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 02/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import Foundation

public extension CHMIconTextView {

    struct HandlerConfiguration: ClearConfigurationProtocol {

        /// Handler to detect when view hit
        public var viewTapHandler: CHMViewBlock<CHMIconTextView>?
    }
}

// MARK: - Clear Handler Configuration

public extension CHMIconTextView.HandlerConfiguration {

    /// Default clear handler configuration
    static let clear = CHMIconTextView.HandlerConfiguration()
}
