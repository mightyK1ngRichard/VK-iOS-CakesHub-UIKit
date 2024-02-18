//
//  CHMNewProductCard+Configuration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 20.01.2024.
//

import SwiftUI

public extension CHMNewProductCard {

    struct Configuration {

        public typealias OwnerViewType = CHMNewProductCard

        /// Configuration of the image view
        var imageConfiguration: MKRImageView.Configuration = .clear
        var badgeViewConfiguration: CHMBadgeView.Configuration = .clear
        var productButtonConfiguration: CHMProductButton.Configuration = .clear
        var starsViewConfiguration: CHMStarsView.Configuration = .clear
        var productText: ProductText = .clear
    }
}

public extension CHMNewProductCard.Configuration {

    struct ProductText {
        var seller: String?
        var productName: String?
        var productPrice: String

        static let clear = Self(productPrice: "0$")

        public init(seller: String? = nil, productName: String? = nil, productPrice: String) {
            self.seller = seller
            self.productName = productName
            self.productPrice = productPrice
        }
    }
}
