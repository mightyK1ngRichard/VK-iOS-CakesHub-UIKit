//
//  CHMButton+HandlerConfiguration.swift
//  CHMUIKIT
//
//  Created by Дмитрий Пермяков on 06.10.2023.
//

import Foundation

public extension CHMButton {

    struct HandlerConfiguration: ClearConfigurationProtocol {

        /// Handler to detect when view hit
        public var viewTapHandler: CHMVoidBlock?
    }
}

// MARK: - Clear Handler Configuration

public extension CHMButton.HandlerConfiguration {

    /// Default clear handler configuration
    static let clear = CHMButton.HandlerConfiguration()
}
