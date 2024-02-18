//
//  CHMBadgeView+Configuration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 20.01.2024.
//

import SwiftUI

public extension CHMBadgeView {

    struct Configuration {
        var text            : String = .clear
        var backgroundColor : Color = .clear
        var foregroundColor : Color = .clear
        var backgroundEdges : EdgeInsets = .init()
        var cornerRadius    : CGFloat = .zero
        var fontSize        : CGFloat = .zero
    }
}

// MARK: - Kind

public extension CHMBadgeView.Configuration {
    
    /// Kind of the background color
    enum Kind {
        case dark
        case red
    }
}

public extension CHMBadgeView.Configuration.Kind {

    var backgroundColor: Color {
        switch self {
        case .dark: return .darkColor
        case .red: return .redColor
        }
    }
}

// MARK: - Constants

private extension Color {

    static let lightRedColor = UIColor(hex: 0xDB3022)
    static let darkRedColor = UIColor(hex: 0xFF3E3E)
    static let redColor = Color(uiColor: UIColor { $0.userInterfaceStyle == .light ? lightRedColor : darkRedColor } )

    static let darkDarkColor = UIColor(hex: 0x1E1F28)
    static let lightDardColor = UIColor(hex: 0x222222)
    static let darkColor = Color(uiColor: UIColor { $0.userInterfaceStyle == .light ? lightDardColor : darkDarkColor })
}
