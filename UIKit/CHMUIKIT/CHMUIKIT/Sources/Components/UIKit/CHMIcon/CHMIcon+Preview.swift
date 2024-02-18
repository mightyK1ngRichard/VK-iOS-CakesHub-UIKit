//
//  CHMIcon+Preview.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 08/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMIconPreview: PreviewProvider {

    static var previews: some View {
        VStack {
            SwiftUIPreview {
                CHMIcon(
                    configuration: .basic(
                        .person,
                        color: .systemPink
                    )
                )
            }
            .fittingSize()
            .previewDisplayName("Default")

            SwiftUIPreview {
                CHMIcon(
                    configuration: .basic(
                        .custom(UIImage(systemName: "doc.text.magnifyingglass")),
                        color: .purple,
                        size: 54
                    )
                )
            }
            .fittingSize()
            .previewDisplayName("Custom")
        }
    }
}
