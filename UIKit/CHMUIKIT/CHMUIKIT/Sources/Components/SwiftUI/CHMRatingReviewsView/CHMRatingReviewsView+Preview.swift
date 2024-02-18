//
//  CHMRatingReviewsView+Preview.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 27.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMRatingReviewsViewPreview: PreviewProvider {
    
    static var previews: some View {
        Group {
            CHMRatingReviewsView(
                configuration: .basic(
                    fiveStarRating: .basic(ration: .hundred, count: 12),
                    fourStarRating: .basic(ration: .sixty, count: 5),
                    threeStarRating: .basic(ration: .thirty, count: 4),
                    twoStarRating: .basic(ration: .twenty, count: 2),
                    oneStarRating: .basic(ration: .zero, count: 0),
                    commonRating: "4.3",
                    commonCount: "23 ratings"
                )
            )
            .previewDisplayName("Basic")
            .previewLayout(.sizeThatFits)
        }
    }
}
