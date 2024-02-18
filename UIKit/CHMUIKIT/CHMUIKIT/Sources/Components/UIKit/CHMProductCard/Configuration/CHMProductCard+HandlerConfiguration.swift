//
//  CHMProductCard+HandlerConfiguration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 10/11/2023.
//

import Foundation

public extension CHMProductCard {

    struct HandlerConfiguration: ClearConfigurationProtocol {

        /// Handler to detect when image hit
        public var actionImageTapHandler: CHMIntBlock?
        /// Handler to detect when basket icon hit
        public var actionBasketTapHandler: CHMVoidBlock?
    }
}

// MARK: - Clear Handler Configuration

public extension CHMProductCard.HandlerConfiguration {

    /// Default clear handler configuration
    static let clear = CHMProductCard.HandlerConfiguration()
}

