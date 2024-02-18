//
//  CHMImageView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 10/10/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMImageView.Configuration {

    /// Дэфолтная конфигурация
    static let clear = CHMImageView.Configuration()

    /// Базовая конфигурация компонента
    /// - Parameters:
    ///   - kind: kind of the image view
    ///   - imageKind: kind of the image shape
    /// - Returns: подготовленную конфигурацию компонента
    static func basic(
        _ kind: ImageConfiguration.Kind,
        imageKind: Kind = .square
    ) -> CHMImageView.Configuration {
        modify(.clear) {
            $0.imageConfiguration = .imageConf(kind)
            $0.backgroundConfiguration = .backgroundConf
            $0.imageKind = imageKind
        }
    }
}

// MARK: - ImageConfiguration

private extension ImageConfiguration {

    static func imageConf(_ kind: Kind) -> Self {
        modify(.clear) {
            $0.kind = kind
            $0.placeholderColor = .placeholder
        }
    }
}

// MARK: - CHMBackgroundView Configuration

private extension CHMBackgroundView.Configuration {

    static var backgroundConf: Self {
        .basic(
            kind: .rectangle(
                color: .background,
                cornerRadius: .zero
            )
        )
    }
}

// MARK: - Constants

private extension UIColor {

    static let background: UIColor = .grayLightGray
    static let placeholder: UIColor = .secondary
}
