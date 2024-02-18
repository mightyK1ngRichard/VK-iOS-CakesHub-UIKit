//
//  NewProductDetailModel.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 04.02.2024.
//

import CHMUIKIT
import SwiftUI
import UIKit

struct NewProductDetailModel {
    var images          : [ProductImage] = []
    var isFavorite      : Bool = false
    var pickers         : [String] = []
    var productName     : String = .clear
    var price           : String = .clear
    var sellerName      : String = .clear
    var description     : String = .clear
    var reviewInfo      : ProductReviewsModel = .clear
    var similarProducts : [SimilarCard] = []
}

extension NewProductDetailModel {

    struct ProductImage: Identifiable {
        let id = UUID()
        var kind: MKRImageView.Configuration.ImageKind
    }

    struct SimilarCard: Identifiable {
        let id = UUID()
        var configuration: CHMNewProductCard.Configuration = .clear
    }

    var starsCount: Int {
        Int(reviewInfo.averageRating.rounded())
    }
}
