//
//  CHMIconTextView+Defaults.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 02/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMIconTextView.Configuration {

    /// Basic configuration
    static let clear = CHMIconTextView.Configuration()

    /// Basic configuration
    /// - Parameters:
    ///   - title: title of the view
    ///   - imageKind: icon of the image view
    ///   - tintColor: icon color
    /// - Returns: configuration of the view
    static func basic(
        title: String,
        imageKind: ImageKind,
        tintColor: UIColor = .blackWhite
    ) -> CHMIconTextView.Configuration {
        modify(.clear) {
            $0.titleConfiguration = .titleConfiguration(title)
            $0.tintColor = tintColor
            $0.image = imageKind.image
            $0.borderColor = .whiteBorder
        }
    }

    /// Basic configuration
    /// - Parameters:
    ///   - title: title of the view
    /// - Returns: configuration of the view
    static func logout(
        title: String
    ) -> CHMIconTextView.Configuration {
        modify(.clear) {
            $0.titleConfiguration = .logoutTitleConfiguration(title)
            $0.tintColor = .logoutColor
            $0.image = ImageKind.logout.image
            $0.borderColor = .logoutColor
        }
    }
}

// MARK: - CHMLabel Configuration

private extension CHMLabel.Configuration {

    static func titleConfiguration(_ title: String) -> Self {
        .custom(
            title,
            titleStyle: .semibold15,
            textColor: .primary,
            alignment: .left,
            numberOfLines: 2,
            lineBreak: .byWordWrapping
        )
    }

    static func logoutTitleConfiguration(_ title: String) -> Self {
        .custom(
            title,
            titleStyle: .semibold15,
            textColor: .logoutColor,
            alignment: .left,
            numberOfLines: 2,
            lineBreak: .byWordWrapping
        )
    }
}

// MARK: - Constants

private extension UIColor {

    static var whiteBorder = UIColor(hex: 0xCBD9C9)
    static var logoutColor = UIColor.orangeBorder
}
