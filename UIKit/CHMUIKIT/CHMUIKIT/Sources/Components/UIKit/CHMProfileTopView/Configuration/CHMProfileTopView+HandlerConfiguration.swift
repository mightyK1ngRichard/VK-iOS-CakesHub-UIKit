//
//  CHMProfileTopView+HandlerConfiguration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 02/12/2023.
//

import Foundation

public extension CHMProfileTopView {

    struct HandlerConfiguration: ClearConfigurationProtocol {

        /// Handler to detect when image hit
        public var imageTapHandler: CHMVoidBlock?
    }
}

// MARK: - Clear Handler Configuration

public extension CHMProfileTopView.HandlerConfiguration {

    /// Default clear handler configuration
    static let clear = CHMProfileTopView.HandlerConfiguration()
}
