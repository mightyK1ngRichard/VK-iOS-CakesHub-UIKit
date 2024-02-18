//
//  CHMAdding_akeView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 11/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMAddingCakeViewPreview: PreviewProvider {

    static var previews: some View {
        Group {
            SwiftUIPreview {
                CHMAddingCakeView(
                    configuration: .basic(
                        .image(.url(.mockCake1, placeholder: .cake))
                    )
                ).with {
                    $0.handlerConfiguration.actionCardTapHandler = {
                        print("Tap!")
                    }
                }
            }
            .previewDisplayName("Image")
            .frame(width: 107, height: 151)

            SwiftUIPreview {
                CHMAddingCakeView(
                    configuration: .basic(
                        .empty
                    )
                )
            }
            .previewDisplayName("Empty")
            .frame(width: 107, height: 151)

            SwiftUIPreview {
                CHMAddingCakeView(
                    configuration: modify (.basic(
                        .image(.url(.mockCake1, placeholder: .cake))
                    )) {
                        $0.plusViewConfiguration.size = .init(edge: 50)
                    }
                )
            }
            .previewDisplayName("Custom")
            .frame(width: 207, height: 251)
        }
    }
}
