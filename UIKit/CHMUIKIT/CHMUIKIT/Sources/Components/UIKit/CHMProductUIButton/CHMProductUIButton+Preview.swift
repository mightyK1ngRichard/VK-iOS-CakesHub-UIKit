//
//  CHMProductUIButton+Preview.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 01.02.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMProductUIButtonPreview: PreviewProvider {

    static var previews: some View {
        Group {
            VStack(spacing: 30) {
                SwiftUIPreview {
                    CHMProductUIButton(
                        configuration: .basic(kind: .favorite(isSelected: true))
                    ).with {
                        $0.didTapButton = { isSelected in
                            print("isSelected: \(isSelected)")
                        }
                    }
                }
                .fittingSize()

                SwiftUIPreview {
                    CHMProductUIButton(
                        configuration: .basic(kind: .favorite(isSelected: false))
                    ) { isSelected in
                        print("isSelected: \(isSelected)")
                    }
                }
                .fittingSize()

                SwiftUIPreview {
                    CHMProductUIButton(configuration: .basic(kind: .basket))
                }
                .fittingSize()
            }
            .previewDisplayName("Default")
        }
    }
}
