//
//  CHMMainProductCard+Defaults.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 31.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMMainProductCard.Configuration {

    /// Basic configuration
    static let clear = CHMMainProductCard.Configuration()

    /// Basic configuration
    /// - Parameters:
    ///   - imageSource: type of the image source
    ///   - productName: product name title
    ///   - sellerName: seller name title
    ///   - price: price title
    ///   - badgeConfiguration: configuration of the badge view
    ///   - productButtonKind: kind of the right button
    ///   - reviewStarsConfiguration: configuration of the stars view
    /// - Returns: configuration of the view
    static func basic(
        imageSource: ImageConfiguration.Kind,
        productName: String,
        sellerName: String,
        price: String,
        badgeConfiguration: CHMCardBadge.Configuration = .clear,
        productButtonKind: CHMProductUIButton.Configuration.Kind,
        reviewStarsConfiguration: CHMReviewStars.Configuration
    ) -> CHMMainProductCard.Configuration {
        modify(.clear) {
            $0.imageViewConfiguration = .basic(imageSource, imageKind: .static(9))
            $0.badgeConfiguration = badgeConfiguration
            $0.reviewStarsViewConfiguration = reviewStarsConfiguration
            $0.productButtonConfiguration = .basic(kind: productButtonKind)
            $0.sellerName = sellerName
            $0.productName = productName
            $0.price = price
        }
    }
}

// MARK: - Constants

private extension UIColor {

    static let sellerTextColor = UIColor(hexLight: 0x9B9B9B, hexDark: 0xABB4BD)
    static let productNameColor = UIColor(hexLight: 0x222222, hexDark: 0xF6F6F6)
}

import SwiftUI

#Preview {
    SwiftUIPreview {
        CHMMainProductCard(
            configuration: .basic(
                imageSource: .url(.mockCake1, placeholder: .cake),
                productName: "Evening Dress",
                sellerName: "Dorothy Perkins",
                price: "14$",
                badgeConfiguration: .basic(kind: .red, text: "-20%"),
                productButtonKind: .favorite(isSelected: true),
                reviewStarsConfiguration: .basic(countStars: 5, countFillStars: 4)
            )
        )
    }
    .frame(width: 150, height: 260)
}
