//
//  CHMProductCard.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 05/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMProductCard.Configuration {

    /// Basic design configuration
    static let clear = CHMProductCard.Configuration()

    /// Basic design configuration
    /// - Parameters:
    ///   - price: product price
    ///   - seller: product seller
    ///   - description: product description
    ///   - images: photo url array
    /// - Returns: designed configuration
    static func basic(
        price: String,
        seller: String,
        description: String,
        images: ImageKind
    ) -> CHMProductCard.Configuration {
        modify(.clear) {
            $0.priceConfiguration = .custom(
                price,
                titleStyle: .semibold19,
                textColor: .primary,
                alignment: .left,
                numberOfLines: .maxNumberLine
            )
            $0.sellerConfiguration = .custom(
                seller,
                titleStyle: .regular13,
                textColor: .primary,
                alignment: .left,
                numberOfLines: .maxNumberLine
            )
            $0.descriptionConfiguration = .custom(
                description,
                titleStyle: .regular13,
                textColor: .secondary,
                alignment: .left,
                numberOfLines: .maxNumberLine,
                lineBreak: .byTruncatingTail
            )
            switch images {
            case .image(let images):
                $0.productCarouselConfiguration = .basic(.image(images))
            case .url(let images):
                $0.productCarouselConfiguration = .basic(.url(images))
            }
        }
    }
}

private extension Int {

    static let maxNumberLine = 1
}
