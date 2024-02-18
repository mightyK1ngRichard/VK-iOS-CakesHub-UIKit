//
//  CHMAddingCakeView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 11/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMAddingCakeView.Configuration {

    /// Basic design configuration
    static let clear = CHMAddingCakeView.Configuration()

    /// Basic design configuration
    /// - Parameters:
    ///   - url: image url
    ///   - imageKind: kind of the image shape
    /// - Returns: designed configuration
    static func basic(
        _ kind: Kind
    ) -> CHMAddingCakeView.Configuration {
        modify(.clear) {
            $0.backgroundViewConfiguration = .basic(
                kind: .rectangle(
                    color: .grayLightGray,
                    cornerRadius: .backgroundCornerRadius,
                    borderWidth: .backgroundBorderWidth,
                    borderColor: .backgroundColor
                )
            )
            switch kind {
            case .empty:
                $0.imageViewConfiguration = .clear
                $0.plusViewConfiguration = .basic(.plus, size: .iconSize)
            case .image(let configuration):
                $0.imageViewConfiguration = .basic(
                    configuration, imageKind: .static(.imageCornerRadius)
                )
                $0.plusViewConfiguration = .basic(.close, size: .iconSize)
            }

        }
    }
}

// MARK: - Constants

private extension CGSize {

    static let iconSize = CGSize(edge: 31)
}

private extension CGFloat {

    static let imageCornerRadius: CGFloat = 8
    static let backgroundCornerRadius: CGFloat = 8
    static let backgroundBorderWidth: CGFloat = 2
}

private extension UIColor {

    static let backgroundColor: UIColor = .secondary.withAlphaComponent(0.5)
}
