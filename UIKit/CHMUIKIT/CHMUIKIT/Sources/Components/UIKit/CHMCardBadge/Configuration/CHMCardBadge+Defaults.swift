//
//  CHMCardBadge+Defaults.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 01.02.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMCardBadge.Configuration {

    /// Basic configuration
    static let clear = CHMCardBadge.Configuration()

    /// Basic configuration
    /// - Parameters:
    ///   - kind: kind of the badge style
    ///   - text: badge text
    /// - Returns: configuration of the view
    static func basic(kind: Kind, text: String) -> CHMCardBadge.Configuration {
        modify(.clear) {
            $0.labelConfiguration = .custom(
                text,
                titleStyle: .semibold11,
                textColor: .white,
                alignment: .center,
                numberOfLines: 1
            )
            $0.backgroundColor = kind.backgroundColor
        }
    }
}

// MARK: - Constants

private extension CGFloat {

    static let viewSize: CGFloat = 32
}
