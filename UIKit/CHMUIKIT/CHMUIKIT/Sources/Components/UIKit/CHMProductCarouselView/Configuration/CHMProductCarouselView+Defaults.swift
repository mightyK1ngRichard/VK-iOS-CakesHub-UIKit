//
//  CHMProductCarouselView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 06/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMProductCarouselView.Configuration {

    /// Basic design configuration
    static let clear = CHMProductCarouselView.Configuration()

    /// Basic design configuration
    /// - Parameters:
    ///   - images: photo url array
    /// - Returns: designed configuration
    static func basic(
        _ kind: Kind
    ) -> CHMProductCarouselView.Configuration {
        modify(.clear) {
            $0.kind = kind
        }
    }
}

// MARK: - Constants

private extension CGFloat {

    static let viewSize: CGFloat = 32
}
