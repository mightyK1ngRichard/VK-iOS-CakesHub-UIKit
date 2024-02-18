//
//  CHMIconLabel+Preview.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 08/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMIconLabelPreview: PreviewProvider {

    static var previews: some View {
        Group {
            SwiftUIPreview {
                CHMIconLabel(
                    configuration: .basic(
                        text: "MightyK1ngRichard",
                        textColor: .primary,
                        iconConfiguration: .basic(.bell, color: .wild)
                    )
                )
            }
            .fittingSize()
            .previewDisplayName("Default")
        }
    }
}
