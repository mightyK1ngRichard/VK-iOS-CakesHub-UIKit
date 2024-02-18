//
//  CHMIcon+Defaults.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 08/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMIcon.Configuration {

    /// Basic configuration
    static let clear = CHMIcon.Configuration()

    /// Basic configuration
    /// - Parameters:
    ///   - url: image url
    ///   - imageKind: kind of the image shape
    /// - Returns: configuration of the view
    static func basic(
        _ kind: IconKind,
        color: UIColor,
        size: CGFloat = 24
    ) -> CHMIcon.Configuration {
        modify(.clear) {
            $0.image = kind.image
            $0.color = color
            $0.iconSize = size
        }
    }
}
