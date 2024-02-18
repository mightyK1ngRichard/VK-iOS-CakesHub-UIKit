//
//  CHMNewCategoryView+Defaults.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 27.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import Foundation

public extension CHMNewCategoryView.Configuration {

    /// Basic configuration
    static let clear = CHMNewCategoryView.Configuration()

    /// Basic configuration
    /// - Parameters:
    ///   - imageKind: image kind
    ///   - title: title of the category view
    /// - Returns: configuration of the view
    static func basic(
        imageKind: MKRImageView.Configuration.ImageKind,
        title: String
    ) -> Self {
        modify(.clear) {
            $0.imageKindConfiguration = imageKind
            $0.title = title
        }
    }
}
