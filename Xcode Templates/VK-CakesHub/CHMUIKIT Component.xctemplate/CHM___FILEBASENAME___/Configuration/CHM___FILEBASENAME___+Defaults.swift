//
//  CHM___VARIABLE_productName:identifier___+Defaults.swift
//  CHMUIKIT
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___YEAR___ © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHM___VARIABLE_productName:identifier___.Configuration {

    /// Basic configuration
    static let clear = CHM___VARIABLE_productName:identifier___.Configuration()

    /// Basic configuration
    /// - Parameters:
    ///   - url: image url
    ///   - imageKind: kind of the image shape
    /// - Returns: configuration of the view
    static func basic(
        _ url: URL? = .mockLoadingUrl,
        imageKind: CHMImageView.Configuration.Kind
    ) -> CHM___VARIABLE_productName:identifier___.Configuration {
        modify(.clear) {
            $0.imageViewConfiguration = .basic(
                .url(url, placeholder: .cake),
                imageKind: imageKind
            )
            #warning("Добавьте другую логику")
            $0.size = .viewSize
        }
    }
}

// MARK: - Constants

#warning("Добавьте все константы, которые будете использовать в конфигурациях выше")
private extension CGFloat {

    static let viewSize: CGFloat = 32
}
