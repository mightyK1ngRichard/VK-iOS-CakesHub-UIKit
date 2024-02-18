//
//  CHMProductCarouselView+HandlerConfiguration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 10/11/2023.
//

import Foundation

public extension CHMProductCarouselView {

    struct HandlerConfiguration: ClearConfigurationProtocol {

        /// Handler to detect when image hit
        public var actionImageTapHandler: CHMIntBlock?
    }
}

// MARK: - Clear Handler Configuration

public extension CHMProductCarouselView.HandlerConfiguration {

    /// Default clear handler configuration
    static let clear = CHMProductCarouselView.HandlerConfiguration()
}

