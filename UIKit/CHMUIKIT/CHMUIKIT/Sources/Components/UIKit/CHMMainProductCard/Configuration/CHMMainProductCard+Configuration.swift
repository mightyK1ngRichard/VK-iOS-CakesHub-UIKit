//
//  CHMMainProductCard+Configuration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 31.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMMainProductCard {

    struct Configuration {

        public typealias OwnerViewType = CHMMainProductCard

        var imageViewConfiguration: CHMImageView.Configuration = .clear
        var badgeConfiguration: CHMCardBadge.Configuration = .clear
        var reviewStarsViewConfiguration: CHMReviewStars.Configuration = .clear
        var sellerName: String = .clear
        var productName: String = .clear
        var price: String = .clear
        var productButtonConfiguration: CHMProductUIButton.Configuration = .clear
    }
}
