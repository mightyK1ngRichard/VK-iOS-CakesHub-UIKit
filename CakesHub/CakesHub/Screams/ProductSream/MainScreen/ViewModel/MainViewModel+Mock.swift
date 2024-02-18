//
//  MainViewModel+Mock.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 05.02.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI
import UIKit
import CHMUIKIT

extension MainViewModel {

    static let mockData = MainViewModel()
}

// MARK: - Mock Data

extension CHMBigBannerView.Configuration {

    static let mockData = CHMBigBannerView.Configuration.basic(
        imageKind: .image(Image("Big Banner")),
        bannerTitle: "Fashion\nsale",
        buttonTitle: "Check"
    )
}

extension [CHMMainProductCard.Configuration] {

    static let mockNewsData: [CHMMainProductCard.Configuration] = (10...25).map {
        .basic(
            imageSource: .url(.mockProductCard, placeholder: .cake),
            productName: "T-Shirt Sailing",
            sellerName: "Mango Boy",
            price: "\($0!)$",
            badgeConfiguration: .basic(kind: .dark, text: "NEW"),
            productButtonKind: .favorite(isSelected: true),
            reviewStarsConfiguration: .basic(countStars: 5, countFillStars: 4, countReviews: $0)
        )
    }

    static let mockSalesData: [CHMMainProductCard.Configuration] = (10...30).map {
        .basic(
            imageSource: .url([URL.mockProductCard, .mockCake1, .mockCake2, .mockCake3, .mockCake4].randomElement() ?? .mockLoadingUrl, placeholder: .cake),
            productName: "T-Shirt Sailing",
            sellerName: "Mango Boy",
            price: "\($0)$",
            badgeConfiguration: .basic(kind: .red, text: "-10%"),
            productButtonKind: .favorite(isSelected: true),
            reviewStarsConfiguration: .basic(countStars: 5, countFillStars: 4)
        )
    }

    static let mockAllData: [CHMMainProductCard.Configuration] = (10...30).map {
        .basic(
            imageSource: .url(.mockProductCard, placeholder: .cake),
            productName: "T-Shirt Sailing",
            sellerName: "Mango Boy",
            price: "\($0)$",
            productButtonKind: .favorite(isSelected: true),
            reviewStarsConfiguration: .basic(countStars: 5, countFillStars: 4)
        )
    }
}
