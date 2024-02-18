//
//  CHMPlusButton.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 11/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMPlusButton.Configuration {

    /// Basic design configuration
    static let clear = CHMPlusButton.Configuration()

    /// Basic design configuration
    /// - Parameters:
    ///   - url: image url
    /// - Returns: designed configuration
    static func basic(
        _ kind: Kind,
        size: CGSize
    ) -> CHMPlusButton.Configuration {
        modify(.clear) {
            $0.kind = kind
            $0.size = size
            $0.rotation = kind.rotation
        }
    }
}
