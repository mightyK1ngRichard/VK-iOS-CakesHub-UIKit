//
//  CHMBackgroundView.swift
//  CHMUIKIT
//
//  Created by Дмитрий Пермяков on 06.10.2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMBackgroundView.Configuration {

    /// Дэфолтная конфигурация
    static let clear = CHMBackgroundView.Configuration()

    /// Базовая конфигурация компонента
    /// - Parameters:
    ///   - kind: вид конфигурации backgroundView
    /// - Returns: подготовленную конфигурацию компонента
    static func basic(kind: Kind) -> CHMBackgroundView.Configuration {
        modify(.clear) {
            $0.kind = kind
            switch kind {
            case let .circle(color, borderWidth, borderColor):
                $0.bgColor = color
                $0.borderWidth = borderWidth
                $0.borderColor = borderColor

            case let .rectangle(color, cornerRadius, borderWidth, borderColor):
                $0.bgCornerRadius = cornerRadius
                $0.bgColor = color
                $0.borderWidth = borderWidth
                $0.borderColor = borderColor

            case .clear:
                return
            }
        }
    }
}

// MARK: - Constants

private extension CGFloat {

    static let divider: CGFloat = 2
}
