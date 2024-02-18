//
//  CHMBackgroundView.swift
//  CHMUIKIT
//
//  Created by Дмитрий Пермяков on 06.10.2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMBackgroundView {

    struct Configuration {

        public typealias OwnerViewType = CHMBackgroundView

        /// Углы backgroundView
        var bgCornerRadius: CGFloat = .zero
        /// Цвет backgroundView
        public var bgColor: UIColor = .clear
        /// Ширина границ
        var borderWidth: CGFloat = .zero
        /// Цвет границ
        var borderColor: UIColor = .clear
        /// Kind of backgroundView
        var kind: Kind = .clear
    }
}

// MARK: - Kind

public extension CHMBackgroundView.Configuration {
    
    /// Виды конфигураций нашего backgroundView
    enum Kind: Hashable {
        case circle(
            color: UIColor = .clear,
            borderWidth: CGFloat = .zero,
            borderColor: UIColor = .clear
        )
        case rectangle(
            color: UIColor = .clear,
            cornerRadius: CGFloat,
            borderWidth: CGFloat = .zero,
            borderColor: UIColor = .clear
        )
        case clear
    }
}
