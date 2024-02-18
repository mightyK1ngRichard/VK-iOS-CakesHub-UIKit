//
//  CHMProductButton+Configuration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 20.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

public extension CHMProductButton {

    struct Configuration {

        public typealias OwnerViewType = CHMProductButton

        /// Color of the background view
        var backgroundColor: Color = .clear
        /// Icon image
        var iconImage: Image = Image("")
        /// Size of the view
        var buttonSize: CGFloat = .zero
        /// Size of the icon
        var iconSize: CGFloat = .zero
        /// Color of the icon
        var iconColor: Color = .clear
        /// Color of the shadow
        var shadowColor: Color = .clear
    }
}

// MARK: - Kind

extension CHMProductButton.Configuration {
    
    /// Kind of the component icon
    public enum Kind {
        case favorite
        case basket
        case custom(Image, Color)
    }
}

extension CHMProductButton.Configuration.Kind {

    var iconImage: Image {
        switch self {
        case .basket: return Image.basketIcon
        case .favorite: return Image.favoriteBorder
        case let .custom(image, _): return image
        }
    }

    var iconColor: Color {
        switch self {
        case .favorite:
            return Color(hexLight: 0x9B9B9B, hexDarK: 0xABB4BD)
        case .basket:
            return Color(hexLight: 0xF9F9F9, hexDarK: 0xF6F6F6)
        case let .custom(_, color):
            return color
        }
    }

    var backgroundColor: Color {
        switch self {
        case .basket: 
            return Color(hexLight: 0xDB3022, hexDarK: 0xEF3651)
        case .favorite:
            return Color(hexLight: 0xFFFFFF, hexDarK: 0x2A2C36)
        case .custom:
            return Color(hexLight: 0xDB3022, hexDarK: 0xEF3651)
        }
    }

    var shadowColor: Color {
        switch self {
        case .basket: return Color(hexLight: 0xF9F9F9, hexDarK: 0xEF3651, alpha: 0.5)
        case .favorite: return Color(hexLight: 0x9B9B9B, hexDarK: 0x2A2C36, alpha: 0.5)
        case .custom: return Color(hexLight: 0x9B9B9B, hexDarK: 0x2A2C36, alpha: 0.5)
        }
    }
}
