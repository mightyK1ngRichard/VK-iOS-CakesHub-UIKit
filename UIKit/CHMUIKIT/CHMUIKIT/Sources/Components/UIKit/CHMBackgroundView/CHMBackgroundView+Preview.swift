//
//  CHMBackgroundView.swift
//  CHMUIKIT
//
//  Created by Дмитрий Пермяков on 06.10.2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMCellTextFieldPreview: PreviewProvider {

    static var previews: some View {
        Group {
            SwiftUIPreview {
                CHMBackgroundView(configuration: .basic(
                    kind: .rectangle(
                        color: .wild,
                        cornerRadius: 20,
                        borderWidth: 2,
                        borderColor: .systemPink
                    )
                ))
            }
            .previewDisplayName("Rectangle")
            .frame(width: 300, height: 200)

            SwiftUIPreview {
                CHMBackgroundView(configuration: .basic(
                    kind: .circle(
                        color: .blue,
                        borderWidth: 3,
                        borderColor: .systemPink
                    )
                ))
            }
            .previewDisplayName("Circle")
            .frame(width: 200, height: 200)
        }
    }
}
