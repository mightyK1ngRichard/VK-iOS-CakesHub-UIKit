//
//  CHMAddingCakeView+HandlerConfiguration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 12/11/2023.
//

import Foundation

public extension CHMAddingCakeView {

    struct HandlerConfiguration: ClearConfigurationProtocol {

        /// Handler to detect when image hit
        public var actionCardTapHandler: CHMVoidBlock?
    }
}

// MARK: - Clear Handler Configuration

public extension CHMAddingCakeView.HandlerConfiguration {

    /// Default clear handler configuration
    static let clear = CHMAddingCakeView.HandlerConfiguration()
}

