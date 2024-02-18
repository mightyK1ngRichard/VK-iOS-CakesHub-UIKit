//
//  CHMIconLabel+Defaults.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 08/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMIconLabel.Configuration {

    /// Basic configuration
    static let clear = CHMIconLabel.Configuration()

    /// Basic configuration
    /// - Parameters:
    ///   - url: image url
    ///   - imageKind: kind of the image shape
    /// - Returns: configuration of the view
    static func basic(
        text: String,
        textColor: UIColor,
        iconConfiguration: CHMIcon.Configuration
    ) -> CHMIconLabel.Configuration {
        modify(.clear) {
            $0.iconConfiguration = iconConfiguration
            $0.labelConfiguration = .custom(
                text,
                titleStyle: .regular13,
                textColor: textColor,
                alignment: .left,
                numberOfLines: 1,
                lineBreak: .byClipping
            )
            $0.borderColor = .selectedBorder
            $0.unselecredBorderColor = .unselectedBorder
            $0.selectedLabelColor = .unselectedBorder
            $0.unselectedLabelColor = .primary
        }
    }
}

// MARK: - Constants

private extension UIColor {

    static var selectedBorder = UIColor.wild
    static var unselectedBorder = UIColor(hex: 0xDEDEDE)
}
