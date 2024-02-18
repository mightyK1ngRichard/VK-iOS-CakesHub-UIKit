//
//  CHMBigBannerView+Preview.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 28.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMBigBannerViewPreview: PreviewProvider {

    static var previews: some View {
        Group {
            CHMBigBannerView(
                model: {
                    var model = CHMBigBannerView.ObservedConfiguration()
                    model.configuration = .basic(
                        imageKind: .uiImage(UIImage(bundleNamed: "Big Banner")),
                        bannerTitle: "Fashion\nsale",
                        buttonTitle: "Check"
                    )
                    return model
                }()
            )
            .previewDisplayName("Basic")
        }
    }
}
