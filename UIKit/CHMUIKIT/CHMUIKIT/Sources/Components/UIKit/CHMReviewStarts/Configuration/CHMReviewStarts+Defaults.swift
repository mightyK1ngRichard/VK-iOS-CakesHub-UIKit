//
//  CHMReviewStarts+Defaults.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 31.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMReviewStars.Configuration {

    /// Basic configuration
    static let clear = CHMReviewStars.Configuration()

    /// Basic configuration
    /// - Parameters:
    ///   - countStars: count of the stars
    ///   - countFillStars: count of the fill stars
    ///   - countReviews: number of reviews
    /// - Returns: configuration of the view
    static func basic(
        countStars: Int,
        countFillStars: Int,
        countReviews: Int? = nil
    ) -> CHMReviewStars.Configuration {
        modify(.clear) {
            $0.countReviewsConfiguration = .custom(
                countReviews.toCorrectString,
                titleStyle: .regular9,
                textColor: .textSecondary,
                alignment: .center,
                numberOfLines: 1,
                lineBreak: .byCharWrapping
            )
            $0.countReviews = countReviews
            $0.startsCount = countStars
            $0.starSize = .starSize
            $0.countFillStars = countFillStars
            $0.starsPadding = .startPadding
        }
    }
}

// MARK: - Constants

private extension CGFloat {

    static let starSize: CGFloat = 14
    static let startPadding: CGFloat = 3
}

private extension Int? {

    var toCorrectString: String {
        if let self {
            return "(\(self))"
        }
        return ""
    }
}
