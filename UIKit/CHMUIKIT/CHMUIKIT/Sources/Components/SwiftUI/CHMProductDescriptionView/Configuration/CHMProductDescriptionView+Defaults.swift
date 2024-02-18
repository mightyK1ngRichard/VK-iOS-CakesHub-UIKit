//
//  CHMProductDescriptionView+Defaults.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 26.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

public extension CHMProductDescriptionView.Configuration {

    /// Basic configuration
    static let clear = CHMProductDescriptionView.Configuration()

    /// Basic configuration
    /// - Parameters:
    ///   - imageKind: image kind
    ///   - imageSize: image size
    /// - Returns: configuration of the view
    static func basic(
        title: String,
        price: String,
        subtitle: String,
        description: String,
        innerHPadding: CGFloat = 16,
        starsConfiguration: CHMStarsView.Configuration
    ) -> Self {
        modify(.clear) {
            $0.title = title
            $0.price = price
            $0.subtitle = subtitle
            $0.description = description
            $0.innerHPadding = innerHPadding
            $0.starsConfiguration = starsConfiguration
        }
    }
}

// MARK: - Constants

private extension CGFloat {

    static let viewSize: CGFloat = 32
}
