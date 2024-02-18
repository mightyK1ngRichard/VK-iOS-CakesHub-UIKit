//
//  CHMRatingReviewsView+Configuration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 27.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMRatingReviewsView {

    struct Configuration {

        public typealias OwnerViewType = CHMRatingReviewsView

        var counts: [Rating] = []
        var commontRating: String = .clear
        var commentCount: String = .clear
    }
}

// MARK: - RatingData

public extension CHMRatingReviewsView.Configuration {
    
    /// Input data
    struct RatingData {
        let ration: Kind
        let count: Int

        public static func basic(ration: Kind, count: Int) -> Self {
            .init(ration: ration, count: count)
        }
    }
    
    /// Ration kind
    enum Kind: CGFloat, Hashable {
        case zero = 0
        case ten = 0.1
        case twenty = 0.2
        case thirty = 0.3
        case forty = 0.4
        case fifty = 0.5
        case sixty = 0.6
        case seventy = 0.7
        case eighty = 0.8
        case ninety = 0.9
        case hundred = 1
    }
}

extension CHMRatingReviewsView {

    struct Rating: Identifiable {
        let id: Int
        let count: Int
        let ration: CGFloat
    }
}
