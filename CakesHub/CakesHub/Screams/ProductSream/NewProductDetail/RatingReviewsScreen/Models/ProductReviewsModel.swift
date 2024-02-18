//
//  ProductReviewsModel.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 04.02.2024.
//

import Foundation
import CHMUIKIT

struct ProductReviewsModel {
    static let clear = ProductReviewsModel()

    var countFiveStars  : Int     = 0
    var countFourStars  : Int     = 0
    var countThreeStars : Int     = 0
    var countTwoStars   : Int     = 0
    var countOneStars   : Int     = 0
    var countOfComments : Int     = 0
    var comments: [CommentInfo]   = []

    struct CommentInfo: Identifiable {
        let id             = UUID()
        var userName       : String = .clear
        var date           : String = .clear
        var description    : String = .clear
        var countFillStars : Int = 0
        var feedbackCount  : Int = 0
    }
}

// MARK: Calculation values

extension ProductReviewsModel {

    var fiveStarsConfiguration: CHMRatingReviewsView.Configuration.RatingData {
        calculateRatingConfiguration(countFiveStars)
    }
    var fourStarsConfiguration: CHMRatingReviewsView.Configuration.RatingData {
        calculateRatingConfiguration(countFourStars)
    }
    var threeStarsConfiguration: CHMRatingReviewsView.Configuration.RatingData { calculateRatingConfiguration(countThreeStars)
    }
    var twoStarsConfiguration: CHMRatingReviewsView.Configuration.RatingData {
        calculateRatingConfiguration(countTwoStars)
    }
    var oneStarsConfiguration: CHMRatingReviewsView.Configuration.RatingData {
        calculateRatingConfiguration(countOneStars)
    }
    var feedbackCounter: Int {
        countFiveStars + countFourStars + countThreeStars + countTwoStars + countOneStars
    }
    var averageRatingString: String {
        let count: CGFloat = CGFloat(feedbackCounter) / 5
        return "\(count.rounded(toPlaces: 1))"
    }
    var averageRating: CGFloat {
        CGFloat(feedbackCounter) / 5
    }
}

// MARK: Inner logic

private extension ProductReviewsModel {

    func calculateRatingConfiguration(_ count: Int) -> CHMRatingReviewsView.Configuration.RatingData {
        let perсentArea = CGFloat(count) / CGFloat(feedbackCounter)
        let ration = CHMRatingReviewsView.Configuration.Kind(rawValue: perсentArea.rounded(toPlaces: 1)) ?? .zero
        let configuration = CHMRatingReviewsView.Configuration.RatingData.basic(ration: ration, count: count)
        return configuration
    }
}
