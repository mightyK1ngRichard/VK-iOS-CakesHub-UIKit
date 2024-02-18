//
//  CHMAvatarView+Preview.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 02/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMAvatarViewPreview: PreviewProvider {

    static var previews: some View {
        Group {
            SwiftUIPreview {
                CHMAvatarView(
                    configuration: .basic(
                        .url(.mockCake2),
                        imageSize: 200,
                        ringColor: .orangeBorder,
                        ringWidth: 4
                    )
                )
            }
            .fittingSize()
            .previewDisplayName("Default")
        }
    }
}
