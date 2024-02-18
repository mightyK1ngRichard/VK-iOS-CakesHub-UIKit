//
//  CHMProductUIButton+Configuration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 01.02.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMProductUIButton {

    struct Configuration {

        public typealias OwnerViewType = CHMProductUIButton

        var iconViewConfiguration: CHMIcon.Configuration = .clear
        var backgroundColor: UIColor = .clear
        var shadowColor: UIColor = .clear
        var isSelected: Bool = false
    }
}

// MARK: - Kind

public extension CHMProductUIButton.Configuration {

    /// Kind of the component icon
    enum Kind {
        case favorite(isSelected: Bool = false)
        case basket
        case custom(UIImage, UIColor)
    }
}

extension CHMProductUIButton.Configuration.Kind {

    var iconImage: UIImage? {
        switch self {
        case .basket: return .basketIcon
        case let .favorite(isSelected): return isSelected ? .favoritePressed : .favoriteBorder
        case let .custom(image, _): return image
        }
    }

    var iconColor: UIColor {
        switch self {
        case let .favorite(isSelected):
            return isSelected ? UIColor(hexLight: 0xDB3022, hexDark: 0xEF3651) : UIColor(hexLight: 0x9B9B9B, hexDark: 0xABB4BD)
        case .basket:
            return UIColor(hexLight: 0xF9F9F9, hexDark: 0xF6F6F6)
        case let .custom(_, color):
            return color
        }
    }

    var backgroundColor: UIColor {
        switch self {
        case .basket:
            return UIColor(hexLight: 0xDB3022, hexDark: 0xEF3651)
        case .favorite:
            return UIColor(hexLight: 0xFFFFFF, hexDark: 0x2A2C36)
        case .custom:
            return UIColor(hexLight: 0xDB3022, hexDark: 0xEF3651)
        }
    }

    var shadowColor: UIColor {
        switch self {
        case .basket: return UIColor(hexLight: 0xF9F9F9, hexDark: 0xDB3022)
        case .favorite: return UIColor(hexLight: 0x9B9B9B, hexDark: 0x2A2C36)
        case .custom: return UIColor(hexLight: 0x9B9B9B, hexDark: 0x2A2C36)
        }
    }
}
