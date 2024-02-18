//
//  CHMPlusButton.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 11/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMPlusButtonPreview: PreviewProvider {

    static var previews: some View {
        Group {
            SwiftUIPreview {
                CHMPlusButton(
                    configuration: .basic(.plus, size: CGSize(edge: 50))
                )
            }
            .previewDisplayName("Default")
        }
    }
}
