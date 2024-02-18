//
//  ProductReviewsModelMockData.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 04.02.2024.
//

import Foundation

// MARK: - ProductReviewsModel

extension ProductReviewsModel {

    static let mockData = ProductReviewsModel(
        countFiveStars: 12,
        countFourStars: 5,
        countThreeStars: 4,
        countTwoStars: 2,
        countOneStars: 0,
        countOfComments: [ProductReviewsModel.CommentInfo].mockData.count,
        comments: .mockData
    )
}

// MARK: - CommentInfo

private extension [ProductReviewsModel.CommentInfo] {

    static let mockData: [ProductReviewsModel.CommentInfo] = (0...30).map { .mockData($0) }
}

private extension ProductReviewsModel.CommentInfo {

    static func mockData(_ number: Int) -> Self {
        ProductReviewsModel.CommentInfo(
            userName: "Helene Moore \(number)",
            date: "June 5, 2019",
            description: .commentText,
            countFillStars: number % 6,
            feedbackCount: number
        )
    }
}

private extension String {

    static let commentText = """
    The dress is great! Very classy and comfortable. It fit perfectly! I'm 5'7" and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn't recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well.
    """
}
