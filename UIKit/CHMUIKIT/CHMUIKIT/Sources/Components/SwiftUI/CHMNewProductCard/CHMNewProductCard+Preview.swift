//
//  CHMNewProductCard+Preview.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 20.01.2024.
//

import SwiftUI

struct CHMNewProductCard_Previews: PreviewProvider {

    static var previews: some View {
        VStack(spacing: 20) {
            CHMNewProductCard(
                configuration: .basic(
                    imageKind: .url(.mockProductCard),
                    imageSize: CGSize(width: .cardWidth, height: .imageHeigth),
                    productText: .init(
                        seller: "Mango Boy",
                        productName: "T-Shirt Sailing",
                        productPrice: "10$"
                    ),
                    productButtonConfiguration: .basic(kind: .favorite),
                    starsViewConfiguration: .basic(kind: .four, feedbackCount: 8)
                )
            ) {
                print("Did tap favorite icon")
            }
            .frame(width: .cardWidth)

            CHMNewProductCard(
                configuration: .basic(
                    imageKind: .url(.mockProductCard),
                    imageSize: CGSize(width: .cardWidth, height: .imageHeigth),
                    productText: .init(
                        seller: "Mango Boy",
                        productName: "T-Shirt Sailing",
                        productPrice: "10$"
                    ),
                    productButtonConfiguration: .basic(kind: .basket),
                    starsViewConfiguration: .basic(kind: .four, feedbackCount: 12)
                )
            ){
                print("Did tap basket icon")
            }
            .frame(width: .cardWidth)
        }
    }
}

// MARK: - Constants

private extension CGFloat {

    static let cardWidth: CGFloat = 148
    static let imageHeigth: CGFloat = 184
}
