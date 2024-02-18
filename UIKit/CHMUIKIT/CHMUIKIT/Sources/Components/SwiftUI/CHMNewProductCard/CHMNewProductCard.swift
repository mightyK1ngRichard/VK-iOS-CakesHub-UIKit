//
//  CHMNewProductCard.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 20.01.2024.
//

import SwiftUI

/**
Component `CHMNewProductCard`

For example:
```swift
let view = CHMNewProductCard(
    configuration: .constant(
        .basic(
            imageKind: .url(.mockProductCard),
            imageSize: CGSize(width: 148, height: 184),
            productText: .init(
                seller: "Mango Boy",
                productName: "T-Shirt Sailing",
                productPrice: "10$"
            ),
            productButtonConfiguration: .basic(kind: .favorite),
            starsViewConfiguration: .basic(kind: .four, feedbackCount: 8)
        )
    )
)
```
*/
public struct CHMNewProductCard: View {
    
    let configuration: Configuration
    var didTapButton: CHMVoidBlock?

    public init(configuration: Configuration, didTapButton: CHMVoidBlock? = nil) {
        self.configuration = configuration
        self.didTapButton = didTapButton
    }

    public var body: some View {
        VStack(alignment: .leading) {
            ImageBlock
            FooterBlockView
                .padding(.top, 2)
        }
    }
}

// MARK: - Subviews

private extension CHMNewProductCard {

    var ImageBlock: some View {
        MKRImageView(configuration: configuration.imageConfiguration)
        .overlay(alignment: .topLeading) {
            CHMBadgeView(configuration: configuration.badgeViewConfiguration)
            .padding([.top, .leading], 8)
        }
        .overlay(alignment: .bottomTrailing) {
            CHMProductButton(
                configuration: configuration.productButtonConfiguration,
                didTapButton: didTapButton
            )
                .offset(y: 18)
        }
    }

    var FooterBlockView: some View {
        VStack(alignment: .leading) {
            StartsBlockView
            TextBlockView
        }
    }

    var StartsBlockView: some View {
        CHMStarsView(configuration: configuration.starsViewConfiguration)
    }

    var TextBlockView: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let seller = configuration.productText.seller {
                Text(seller)
                    .font(.system(size: 11))
                    .foregroundStyle(Color.sellerTextColor)
                    .lineLimit(1)
            }

            if let productName = configuration.productText.productName {
                Text(productName)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color.productNameColor)
                    .lineLimit(1)
            }

            Text(configuration.productText.productPrice)
                .font(.system(size: 14))
                .foregroundStyle(Color.productNameColor)
        }
    }
}

// MARK: - Preview

#Preview {
    CHMNewProductCard(
        configuration: .basic(
            imageKind: .url(.mockProductCard),
            imageSize: CGSize(width: 148, height: 184),
            productText: .init(
                seller: "Mango Boy",
                productName: "T-Shirt Sailing",
                productPrice: "10$"
            ),
            productButtonConfiguration: .basic(kind: .favorite),
            starsViewConfiguration: .basic(kind: .four, feedbackCount: 20000)
        )
    )
    .frame(width: 148)
}

// MARK: - Constants

private extension Color {

    static let sellerTextColor = Color(hexLight: 0x9B9B9B, hexDarK: 0xABB4BD)
    static let productNameColor = Color(hexLight: 0x222222, hexDarK: 0xF6F6F6)
}
