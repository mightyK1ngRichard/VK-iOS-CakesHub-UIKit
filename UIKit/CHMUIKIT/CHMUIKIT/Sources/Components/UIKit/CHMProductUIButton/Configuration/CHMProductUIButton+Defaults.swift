//
//  CHMProductUIButton+Defaults.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 01.02.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMProductUIButton.Configuration {

    /// Basic configuration
    static let clear = CHMProductUIButton.Configuration()

    /// Basic configuration
    /// - Parameters:
    ///   - kind: button kind
    /// - Returns: configuration of the view
    static func basic(
        kind: Kind
    ) -> CHMProductUIButton.Configuration {
        modify(.clear) {
            $0.iconViewConfiguration = .basic(.custom(kind.iconImage), color: kind.iconColor)
            $0.backgroundColor = kind.backgroundColor
            $0.shadowColor = kind.shadowColor
            switch kind {
            case .favorite(let isSelected):
                $0.isSelected = isSelected
            default: break
            }
        }
    }
}

// MARK: - Constants

private extension CGFloat {

    static let viewSize: CGFloat = 32
}
