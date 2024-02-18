//
//  TypographicStyle.swift
//  CHMUIKIT
//
//  Created by Дмитрий Пермяков on 06.10.2023.
//

import UIKit

public final class CustomFont {

    var size: CGFloat
    var weight: UIFont.Weight
    var lineHeight: CGFloat

    public var font: UIFont {
        .systemFont(ofSize: size, weight: weight)
    }

    init(
        size: CGFloat,
        weight: UIFont.Weight,
        lineHeight: CGFloat
    ) {
        self.size = size
        self.weight = weight
        self.lineHeight = lineHeight
    }
}

// MARK: - Configurations

public extension CustomFont {

    static let bold34 = CustomFont(size: 35, weight: .bold, lineHeight: 42)

    static let regular = CustomFont(size: 37, weight: .regular, lineHeight: 40)
    static let regular17 = CustomFont(size: 17, weight: .regular, lineHeight: 20)
    static let regular13 = CustomFont(size: 13, weight: .regular, lineHeight: 16)
    static let regular15 = CustomFont(size: 15, weight: .regular, lineHeight: 18)
    static let regular11 = CustomFont(size: 11, weight: .regular, lineHeight: 16)
    static let regular9 = CustomFont(size: 9, weight: .regular, lineHeight: 12)
    static let regular10 = CustomFont(size: 10, weight: .regular, lineHeight: 13)

    static let semibold24 = CustomFont(size: 25, weight: .semibold, lineHeight: 30)
    static let semibold19 = CustomFont(size: 20, weight: .semibold, lineHeight: 25)
    static let semibold13 = CustomFont(size: 14, weight: .semibold, lineHeight: 19)
    static let semibold16 = CustomFont(size: 16, weight: .semibold, lineHeight: 20)
    static let semibold17 = CustomFont(size: 18, weight: .semibold, lineHeight: 23)
    static let semibold15 = CustomFont(size: 16, weight: .semibold, lineHeight: 23)
    static let semibold12 = CustomFont(size: 13, weight: .semibold, lineHeight: 17)
    static let semibold11 = CustomFont(size: 12, weight: .semibold, lineHeight: 14)
    static let semibold9 = CustomFont(size: 9, weight: .semibold, lineHeight: 11)

    static let medium14 = CustomFont(size: 14, weight: .medium, lineHeight: 19)
}

extension CustomFont {

    // MARK: Clear

    static let clear = CustomFont(size: .zero, weight: .regular, lineHeight: .zero)
}
