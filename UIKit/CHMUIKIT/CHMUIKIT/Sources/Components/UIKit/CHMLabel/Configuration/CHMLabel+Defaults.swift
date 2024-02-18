//
//  CHMLabel.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 23/10/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMLabel.Configuration {

    /// Basic design configuration
    static let clear = CHMLabel.Configuration()

    /// Basic design configuration
    /// - Parameters:
    ///   - title: label title
    ///   - titleStyle: label font
    ///   - textColor: label color
    ///   - alignment: label alignment
    /// - Returns: designed configuration
    static func custom(
        _ title: String,
        titleStyle: CustomFont = .semibold15,
        textColor: UIColor = .label,
        alignment: NSTextAlignment = .left,
        numberOfLines: Int = .zero,
        lineBreak: NSLineBreakMode = .byCharWrapping
    ) -> CHMLabel.Configuration {
        modify(.clear) {
            $0.labelConfiguration = .basic(
                attributedString: NSAttributedString(
                    string: title,
                    attributes: .attributes(
                        style: titleStyle,
                        textColor: textColor,
                        alignment: alignment
                    )
                )
            )
            $0.numberOfLines = numberOfLines
            $0.lineBreak = lineBreak
        }
    }
}
