//
//  CHMCategoryView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 06/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMCategoryViewPreview: PreviewProvider {

    static var previews: some View {
        Group {
            SwiftUIPreview {
                CHMCategoryView(
                    configuration: .basic(
                        URL(string: "https://i.pinimg.com/originals/bc/91/a5/bc91a530c65a0a55cb83ba1595f32a7e.jpg"),
                        title: "Свадебные"
                    )
                )
            }
            .previewDisplayName("Default")
            .frame(width: 150, height: 150)

            SwiftUIPreview {
                CHMCategoryView(
                    configuration: .basic(
                        nil,
                        title: "День рождения"
                    )
                )
            }
            .previewDisplayName("Empty view")
            .frame(width: 150, height: 150)
        }
    }
}
