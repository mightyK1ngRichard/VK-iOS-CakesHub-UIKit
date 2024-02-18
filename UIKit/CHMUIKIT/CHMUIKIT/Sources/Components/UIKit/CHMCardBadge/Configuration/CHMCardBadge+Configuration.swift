//
//  CHMCardBadge+Configuration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 01.02.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMCardBadge {

    struct Configuration {

        public typealias OwnerViewType = CHMCardBadge

        /// Configuration of the image view
        var labelConfiguration: CHMLabel.Configuration = .clear
        var backgroundColor: UIColor = .clear

        /// Size of the view
        var size: CGFloat = .zero
    }
}

// MARK: - Kind

public extension CHMCardBadge.Configuration {

    /// Kind of the background color
    enum Kind {
        case dark
        case red
    }
}

public extension CHMCardBadge.Configuration.Kind {

    var backgroundColor: UIColor {
        switch self {
        case .dark: return .darkColor
        case .red: return .redColor
        }
    }
}

// MARK: - Constants

private extension UIColor {

    static let lightRedColor  = UIColor(hex: 0xDB3022)
    static let darkRedColor   = UIColor(hex: 0xFF3E3E)
    static let redColor       = UIColor { $0.userInterfaceStyle == .light ? lightRedColor : darkRedColor }
    static let darkDarkColor  = UIColor(hex: 0x1E1F28)
    static let lightDardColor = UIColor(hex: 0x222222)
    static let darkColor      = UIColor { $0.userInterfaceStyle == .light ? lightDardColor : darkDarkColor }
}
