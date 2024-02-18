//
//  CHMProductDescriptionView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 26.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

/**
 Component `CHMProductDescriptionView`

 For example:
 ```swift
 let view = CHMProductDescriptionView(
     configuration: .basic(
         title: "H&M",
         price: "$19.99",
         subtitle: "Short black dress",
         description: "Просто описание",
         starsConfiguration: .basic(kind: .five, feedbackCount: 10)
     )
 )
 ```
*/
public struct CHMProductDescriptionView: View {

    public let configuration: Configuration
    @State private var favoriteIsSelected = false
    @State private var lastSelectedPickerItem: Int?

    public init(configuration: Configuration) {
        self.configuration = configuration
    }

    public var body: some View  {
        VStack(alignment: .leading) {
            TextBlock
                .padding(.horizontal, configuration.innerHPadding)
                .padding(.top, 15)

            StarsBlock
                .padding(.horizontal, configuration.innerHPadding)

            DescriptionBlock
                .padding(.horizontal, configuration.innerHPadding)
                .padding(.top, 16)
        }
    }
}

// MARK: - Subviews

private extension CHMProductDescriptionView {

    @ViewBuilder
    var FavoriteIcon: some View {
        CHMProductButton(
            configuration: modify(.basic(kind: .favorite)) {
                if favoriteIsSelected {
                    $0.iconColor = .bgBasketColor
                }
            }
        ) {
            favoriteIsSelected.toggle()
        }
    }

    var TextBlock: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Text(configuration.title)
                    .titleFont
                Spacer()
                Text(configuration.price)
                    .titleFont
            }

            Text(configuration.subtitle)
                .subtitleFont
        }
    }

    var StarsBlock: some View {
        CHMStarsView(configuration: configuration.starsConfiguration)
    }

    var DescriptionBlock: some View {
        Text(configuration.description)
            .descriptionFont
    }
}

// MARK: - Preview

#Preview {
    CHMProductDescriptionView(
        configuration: .basic(
            title: "H&M",
            price: "$19.99",
            subtitle: "Short black dress",
            description: "Просто описание",
            starsConfiguration: .basic(kind: .five, feedbackCount: 10)
        )
    )
}

// MARK: - Text

private extension Text {

    var titleFont: some View {
        self
            .font(.system(size: 24, weight: .semibold))
            .foregroundStyle(Color.textPrimary)
    }

    var subtitleFont: some View {
        self
            .font(.system(size: 11, weight: .regular))
            .foregroundStyle(Color.textSecondary)
    }

    var descriptionFont: some View {
        self
            .font(.system(size: 14, weight: .regular))
            .foregroundStyle(Color.textSecondary)
            .lineSpacing(6)
    }
}
