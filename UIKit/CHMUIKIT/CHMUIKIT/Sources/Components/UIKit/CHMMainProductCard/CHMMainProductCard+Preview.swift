//
//  CHMMainProductCard+Preview.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 31.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMMainProductCardPreview: PreviewProvider {

    static var previews: some View {
        ScrollView {
            VStack(spacing: 30) {
                SwiftUIPreview {
                    CHMMainProductCard(
                        configuration: .basic(
                            imageSource: .url(.mockProductCard, placeholder: .cake),
                            productName: "Evening Dress",
                            sellerName: "Dorothy Perkins",
                            price: "14$",
                            badgeConfiguration: .basic(kind: .red, text: "-10%"),
                            productButtonKind: .favorite(isSelected: true),
                            reviewStarsConfiguration: .basic(countStars: 5, countFillStars: 4)
                        )
                    ).with {
                        $0.didTapButton = { isSelected in
                            print("isSelected: \(isSelected)")
                        }
                    }
                }
                .frame(width: 150, height: 260)

                SwiftUIPreview {
                    CHMMainProductCard(
                        configuration: .basic(
                            imageSource: .url(.mockProductCard, placeholder: .cake),
                            productName: "Evening Dress",
                            sellerName: "Dorothy Perkins",
                            price: "14$",
                            badgeConfiguration: .basic(kind: .dark, text: "NEW"),
                            productButtonKind: .favorite(isSelected: false),
                            reviewStarsConfiguration: .basic(countStars: 5, countFillStars: 1)
                        )
                    )
                }
                .frame(width: 150, height: 260)

                SwiftUIPreview {
                    CHMMainProductCard(
                        configuration: .basic(
                            imageSource: .url(.mockProductCard, placeholder: .cake),
                            productName: "Evening Dress",
                            sellerName: "Dorothy Perkins",
                            price: "14$",
                            badgeConfiguration: .basic(kind: .dark, text: "NEW"),
                            productButtonKind: .basket,
                            reviewStarsConfiguration: .basic(countStars: 5, countFillStars: 1)
                        )
                    )
                }
                .frame(width: 150, height: 260)
            }
            .frame(maxWidth: .infinity)
        }
    }
}
