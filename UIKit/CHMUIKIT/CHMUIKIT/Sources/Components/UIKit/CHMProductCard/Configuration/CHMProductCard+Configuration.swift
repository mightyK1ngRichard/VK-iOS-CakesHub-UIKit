//
//  CHMProductCard.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 05/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMProductCard {

    struct Configuration {

        /// Configuration of the price label
        var priceConfiguration: CHMLabel.Configuration = .clear
        /// Configuration of the seller label
        var sellerConfiguration: CHMLabel.Configuration = .clear
        /// Configuration of the description label
        var descriptionConfiguration: CHMLabel.Configuration = .clear
        /// Product carousel view
        var productCarouselConfiguration: CHMProductCarouselView.Configuration = .clear
    }
}

public extension CHMProductCard.Configuration {
    
    /// Kind of the image
    enum ImageKind: Hashable {
        case image([UIImage?])
        case url([URL?])
    }
}
