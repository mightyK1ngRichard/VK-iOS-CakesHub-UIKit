//
//  CHMProductButton+Defaults.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 20.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import Foundation

public extension CHMProductButton.Configuration {

    /// Basic configuration
    static let clear = CHMProductButton.Configuration()

    /// Basic configuration
    /// - Parameters:
    ///   - imageKind: image kind
    ///   - imageSize: image size
    /// - Returns: configuration of the view
    static func basic(
        kind: Kind
    ) -> Self {
        modify(.clear) {
            $0.backgroundColor = kind.backgroundColor
            $0.iconImage = kind.iconImage
            $0.iconSize = .iconSize
            $0.buttonSize = .buttonSize
            $0.iconColor = kind.iconColor
            $0.shadowColor = kind.shadowColor
        }
    }
}

// MARK: - Constants

private extension CGFloat {

    static let buttonSize: CGFloat = 36
    static let iconSize: CGFloat = 12
}
