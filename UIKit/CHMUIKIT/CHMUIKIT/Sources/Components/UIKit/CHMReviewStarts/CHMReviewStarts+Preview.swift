//
//  CHMReviewStarts+Preview.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 31.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMReviewStartsPreview: PreviewProvider {

    static var previews: some View {
        Group {
            VStack(spacing: 40) {
                SwiftUIPreview {
                    CHMReviewStars(
                        configuration: .basic(countStars: 5, countFillStars: 4, countReviews: 100)
                    )
                }
                .fittingSize()

                SwiftUIPreview {
                    CHMReviewStars(
                        configuration: .basic(countStars: 2, countFillStars: 1)
                    )
                }
                .fittingSize()

                SwiftUIPreview {
                    CHMReviewStars(
                        configuration: .basic(countStars: 5, countFillStars: 4)
                    )
                }
                .fittingSize()

                SwiftUIPreview {
                    CHMReviewStars(
                        configuration: modify(.basic(countStars: 5, countFillStars: 4)) {
                            $0.starSize = 32
                            $0.starsPadding = 4
                        }
                    )
                }
                .fittingSize()
            }
            .previewDisplayName("Default")
        }
    }
}
