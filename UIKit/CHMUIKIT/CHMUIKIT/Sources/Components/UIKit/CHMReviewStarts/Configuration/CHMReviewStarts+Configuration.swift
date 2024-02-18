//
//  CHMReviewStarts+Configuration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 31.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMReviewStars {

    struct Configuration {
        var countReviewsConfiguration: CHMLabel.Configuration = .clear

        var countReviews: Int? = nil
        var size: CGFloat = .zero
        var startsCount: Int = .zero
        var starSize: CGFloat = .zero
        var countFillStars: Int = .zero
        var starsPadding: CGFloat = .zero
    }
}
