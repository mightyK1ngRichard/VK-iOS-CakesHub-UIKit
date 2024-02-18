//
//  CHMProductCarouselView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 06/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMProductCarouselViewPreview: PreviewProvider {

    static var previews: some View {
        Group {
            SwiftUIPreview {
                CHMProductCarouselView(
                    configuration: .basic(
                        .url([
                            .mockLoadingUrl,
                            .mockCake1,
                            .mockCake2,
                            .mockCake3,
                            .mockCake4,
                            .invalidUrl,
                        ])
                    )
                ).with {
                    $0.handlerConfiguration.actionImageTapHandler = { imageNum in
                        print("selected \(imageNum)")
                    }
                }
            }
            .previewDisplayName("Default")
            .frame(width: 300, height: 500)

            SwiftUIPreview {
                CHMProductCarouselView(
                    configuration: .basic(
                        .image(
                            Array(repeating: UIImage(bundleNamed: "cake"), count: 5)
                        )
                    )
                ).with {
                    $0.handlerConfiguration.actionImageTapHandler = { imageNum in
                        print("selected \(imageNum)")
                    }
                }
            }
            .previewDisplayName("UIImages")
            .frame(width: 300, height: 500)
        }
    }
}
