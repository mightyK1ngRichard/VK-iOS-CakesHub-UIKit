//
//  CHMStarsView+Defaults.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 20.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

public extension CHMStarsView.Configuration {

    /// Basic configuration
    static let clear = CHMStarsView.Configuration()

    /// Basic configuration
    /// - Parameters:
    ///   - kind: count of the fill stars
    ///   - feedbackCount: count of the feedback
    /// - Returns: configuration of the view
    static func basic(
        kind: Kind,
        feedbackCount: Int? = nil
    ) -> Self {
        modify(.clear) {
            $0.countFillStars = kind.rawValue
            $0.feedbackCount = feedbackCount
            $0.starWidth = .starWidth
            $0.padding = .padding
            $0.foregroundColor = .foregroundColor
            $0.lineHeigth = .lineHeigth
            $0.leftPadding = .leftPadding
        }
    }
}

// MARK: - Constants

private extension CGFloat {

    static let starWidth: CGFloat = 13
    static let padding: CGFloat = 2
    static let lineHeigth: CGFloat = 10
    static let leftPadding: CGFloat = 4
}

private extension Color {

    static let lightForegroundColor = UIColor(hex: 0x9B9B9B)
    static let darkForegroundColor = UIColor(hex: 0xABB4BD)
    static let foregroundColor = Color(uiColor: UIColor { $0.userInterfaceStyle == .light ? lightForegroundColor : darkForegroundColor})
}
