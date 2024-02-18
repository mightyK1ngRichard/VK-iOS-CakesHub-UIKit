//
//  CHMPicker+Defaults.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 27.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

public extension CHMPicker.Configuration {

    /// Basic configuration
    static let clear = CHMPicker.Configuration()

    /// Basic configuration
    /// - Parameters:
    ///   - text: title of the component
    /// - Returns: configuration of the view
    static func basic(_ text: String, currentState: Bool = false) -> CHMPicker.Configuration {
        modify(.clear) {
            $0.text = text
            $0.textColor = .textPrimary
            $0.selectedBorderColor = .selectedBorderColor
            $0.unselectedBorderColor = .unselectedBorderColor
            $0.iconColor = .iconColor
        }
    }
}

private extension Color {

    static let iconColor = Color(uiColor: UIColor(hex: 0xABB4BD))
    static let selectedBorderColor = Color(hexLight: 0xF01F0E, hexDarK: 0xFF2424)
    static let unselectedBorderColor = Color(hexLight: 0x9B9B9B, hexDarK: 0xABB4BD)
}
