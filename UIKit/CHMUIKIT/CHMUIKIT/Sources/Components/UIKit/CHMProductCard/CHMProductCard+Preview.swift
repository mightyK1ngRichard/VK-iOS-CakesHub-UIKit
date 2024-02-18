//
//  CHMProductCard.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 05/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMProductCardPreview: PreviewProvider {

    static var previews: some View {
        Group {
            productCard
            .previewDisplayName("Default")
            .frame(width: 176, height: 353)

            productCard
            .previewDisplayName("Full Screen")

            SwiftUIPreview {
                CHMProductCard(
                    configuration: .basic(
                        price: "11000 $",
                        seller: "Juster for Babies",
                        description: "Самый крутой торт всея всех тортов",
                        images: .url([
                            .mockLoadingUrl,
                            .mockCake1,
                            .mockCake2,
                            .mockCake3,
                            .mockCake4,
                            .invalidUrl,
                        ])
                    )
                ).with {
                    $0.handlerConfiguration.actionImageTapHandler = { number in
                        print("pressed image: \(number)")
                    }
                    $0.handlerConfiguration.actionBasketTapHandler = {
                        print("Basket has been pressed")
                    }
                }
            }
            .previewDisplayName("Handler view")
        }
    }
}

// MARK: - CHMProductCardPreview

private extension CHMProductCardPreview {

    static var productCard: some View {
        SwiftUIPreview {
            CHMProductCard(
                configuration: .basic(
                    price: "11000 $",
                    seller: "Juster for Babies",
                    description: "Самый крутой торт всея всех тортов",
                    images: .url([
                        .mockLoadingUrl,
                        .mockCake1,
                        .mockCake2,
                        .mockCake3,
                        .mockCake4,
                        .invalidUrl,
                    ])
                )
            )
        }
    }
}
