//
//  Color+Extenstions.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 20.01.2024.
//

import SwiftUI

public extension Color {

    init(hexLight: Int, hexDarK: Int, alpha: CGFloat = 1.0) {
        let lightColor = UIColor(hex: hexLight, alpha: alpha)
        let darkColor = UIColor(hex: hexDarK, alpha: alpha)
        self.init(uiColor: UIColor { $0.userInterfaceStyle == .light ? lightColor : darkColor })
    }

    init(hexLight: Int, hexDarK: Int, alphaLight: CGFloat = 1.0, alphaDark: CGFloat = 1.0) {
        let lightColor = UIColor(hex: hexLight, alpha: alphaLight)
        let darkColor = UIColor(hex: hexDarK, alpha: alphaDark)
        self.init(uiColor: UIColor { $0.userInterfaceStyle == .light ? lightColor : darkColor })
    }
}
