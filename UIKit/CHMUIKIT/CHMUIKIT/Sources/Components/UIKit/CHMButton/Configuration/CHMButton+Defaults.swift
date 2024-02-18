//
//  CHMButton.swift
//  CHMUIKIT
//
//  Created by Дмитрий Пермяков on 06.10.2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMButton.Configuration {

    /// Дэфолтная конфигурация
    static let clear = CHMButton.Configuration()

    /// Базовая конфигурация компонента
    /// - Parameters:
    ///   - kind: Вид кнопки
    ///   - title: Загловок кнопки
    /// - Returns: подготовленную конфигурацию компонента
    static func basic(kind: Kind, title: String) -> CHMButton.Configuration {
        modify(.clear) {
            switch kind {
            case .custom:
                $0.labelConfiguration = .labelConf(title)
                $0.backgroundConfiguration = .bgConf

            case .bordered:
                $0.labelConfiguration = .borderedLabelConf(title)
                $0.backgroundConfiguration = .borderedBgConf
            case .cake:
                $0.labelConfiguration = .cakeLabelConf(title)
                $0.backgroundConfiguration = .bgCakeConf
            case .cakeBordered:
                $0.labelConfiguration = .cakeBordedLabelConf(title)
                $0.backgroundConfiguration = .bgCakeBordedConf
            }
        }
    }
}

// MARK: - CHMBackgroundView Configuration

private extension CHMBackgroundView.Configuration {
    
    /// Configuration of the backgroundView for the custom button
    static var bgConf: Self {
        .basic(
            kind: .rectangle(
                color: .buttonBgColor,
                cornerRadius: .cornerRadius,
                borderWidth: .zero,
                borderColor: .clear
            )
        )
    }

    /// Configuration of the backgroundView for the cake button
    static var bgCakeConf: Self {
        .basic(
            kind: .rectangle(
                color: .buttonBgColor,
                cornerRadius: .cornerCakeRadius,
                borderWidth: .zero,
                borderColor: .clear
            )
        )
    }

    /// Configuration of the backgroundView for the cake borded button
    static var bgCakeBordedConf: Self {
        .basic(
            kind: .rectangle(
                color: .clear,
                cornerRadius: .cornerCakeRadius,
                borderWidth: .borderWidth,
                borderColor: .buttonBgColor
            )
        )
    }

    /// Configuration of the backgroundView for the bordered button
    static var borderedBgConf: Self {
        .basic(
            kind: .rectangle(
                color: .clear,
                cornerRadius: .zero,
                borderWidth: .borderWidth,
                borderColor: .borderColor
            )
        )
    }
}

// MARK: - LabelConfiguration

private extension LabelConfiguration {

    static func labelConf(_ title: String) -> Self {
        .basic(
            attributedString: NSAttributedString(
                string: title,
                attributes: .attributes(
                    style: .semibold15,
                    textColor: .customTitleColor,
                    alignment: .center
                )
            )
        )
    }

    static func cakeLabelConf(_ title: String) -> Self {
        .basic(
            attributedString: NSAttributedString(
                string: title,
                attributes: .attributes(
                    style: .semibold17,
                    textColor: .whiteConst,
                    alignment: .center
                )
            )
        )
    }

    static func cakeBordedLabelConf(_ title: String) -> Self {
        .basic(
            attributedString: NSAttributedString(
                string: title,
                attributes: .attributes(
                    style: .semibold17,
                    textColor: .primary,
                    alignment: .center
                )
            )
        )
    }

    static func borderedLabelConf(_ title: String) -> Self {
        .basic(
            attributedString: NSAttributedString(
                string: title,
                attributes: .attributes(
                    style: .semibold15,
                    textColor: .titleBorderedColor,
                    alignment: .center
                )
            )
        )
    }
}

// MARK: - Constants

private extension CGFloat {

    static let borderWidth: CGFloat = 2
    static let cornerRadius: CGFloat = 16
    static let cornerCakeRadius: CGFloat = 25
}

private extension UIColor {

    static let borderColor = UIColor.purple
    static let buttonBgColor = UIColor.wild
    static let customTitleColor = UIColor.whiteConst
    static let titleBorderedColor = UIColor.blackConst
}
