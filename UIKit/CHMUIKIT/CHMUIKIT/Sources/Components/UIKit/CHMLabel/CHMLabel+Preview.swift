//
//  CHMLabel.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 23/10/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMLabelPreview: PreviewProvider {

    static var previews: some View {
        Group {
            SwiftUIPreview {
                CHMLabel(
                    configuration: .custom(
                        "MightyK1ngRichard",
                        titleStyle: .semibold24,
                        alignment: .center
                    )
                )
            }
            .previewDisplayName("Default")
            .frame(width: 300, height: 200)
        }
    }
}
