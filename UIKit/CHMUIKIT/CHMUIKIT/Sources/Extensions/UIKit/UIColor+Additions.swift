//
//  UIColor+Additions.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 25/10/2023.
//

import UIKit

public extension UIColor {

    static let blackConst = UIColor.black
    static let whiteConst = UIColor.white
    static let warning = UIColor.red
    static let bgMainColor = UIColor(hexLight: 0xF9F9F9, hexDark: 0x1E1F28)
    static let wild = UIColor { $0.userInterfaceStyle == .light ? .lightPink : .darkPink }
    static let whiteDarkGray = UIColor { $0.userInterfaceStyle == .light ? .black : .gray6 }
    static let whiteLightGray = UIColor { $0.userInterfaceStyle == .light ? .black : .gray7 }
    static let whiteBlack = UIColor { $0.userInterfaceStyle == .light ? .white : .black }
    static let blackWhite = UIColor { $0.userInterfaceStyle == .light ? .black : .white }
    static let grayLightGray = UIColor { $0.userInterfaceStyle == .light ? .white2 : .gray7 }
    static let grayDarkGray = UIColor { $0.userInterfaceStyle == .light ? .white2 : .gray6 }
    static let lightGrayDarkGray = UIColor { $0.userInterfaceStyle == .light ? .gray1 : .gray8 }
    static let DarkGrayGray = UIColor { $0.userInterfaceStyle == .light ? .gray5 : .gray2 }
    static let danger = UIColor { $0.userInterfaceStyle == .light ? .redLight : .red }
    static let textLink = UIColor { $0.userInterfaceStyle == .light ? .lightPink : .darkPink }
    static let primary = UIColor { $0.userInterfaceStyle == .light ? .gray6 : .white2 }
    static let secondary = UIColor { $0.userInterfaceStyle == .light ? .gray5 : .gray2 }
    static let success = UIColor { $0.userInterfaceStyle == .light ? .successLight : .successDark }
    static let tertiary = UIColor { $0.userInterfaceStyle == .light ? .gray1 : .gray5 }
    static let pinkRed = UIColor { $0.userInterfaceStyle == .light ? .red1 : .pink1 }
    static let pinkRedInversed = UIColor { $0.userInterfaceStyle == .light ? .pink1 : .red1 }
    static let textPrimary = UIColor(hexLight: 0x222222, hexDark: 0xF6F6F6)
    static let textSecondary = UIColor(hexLight: 0x9B9B9B, hexDark: 0xABB4BD)

    static let white2 = UIColor(hex: 0xF3F3F7)
    static let darkPink = UIColor(hex: 0xD61880)
    static let lightPink = UIColor(hex: 0xE51D8B)
    static let redLight = UIColor(hex: 0xFA2B49)
    static let gray1 = UIColor(hex: 0xC4C4D2)
    static let gray2 = UIColor(hex: 0x9D9DAE)
    static let gray3 = UIColor(hex: 0xC4C4D2)
    static let gray4 = UIColor(hex: 0x8F8FA3)
    static let gray5 = UIColor(hex: 0x5F5F6F)
    static let gray6 = UIColor(hex: 0x242429)
    static let gray7 = UIColor(hex: 0x18181B)
    static let gray8 = UIColor(hex: 0x0a0a0a)
    static let successLight = UIColor(hex: 0x1DAF66)
    static let successDark = UIColor(hex: 0x1DCB34)
    static var orangeBorder = UIColor(hex: 0xF36600)
    static var pink1 = UIColor(hex: 0xF6eDeD)
    static var red1 = UIColor(hex: 0x8e3B47)
}
