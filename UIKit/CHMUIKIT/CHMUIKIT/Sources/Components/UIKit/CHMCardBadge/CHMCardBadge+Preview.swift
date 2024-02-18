//
//  CHMCardBadge+Preview.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 01.02.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMCardBadgePreview: PreviewProvider {

    static var previews: some View {
        Group {
            VStack {
                SwiftUIPreview {
                    CHMCardBadge(configuration: .basic(kind: .red, text: "-20%"))
                }
                .fittingSize()

                SwiftUIPreview {
                    CHMCardBadge(configuration: .basic(kind: .dark, text: "NEW"))
                }
                .fittingSize()
            }
            .previewDisplayName("Default")
        }
    }
}
