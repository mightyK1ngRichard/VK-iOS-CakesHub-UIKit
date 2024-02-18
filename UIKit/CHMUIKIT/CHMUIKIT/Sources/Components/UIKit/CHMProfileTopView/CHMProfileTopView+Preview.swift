//
//  CHMProfileTopView+Preview.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 02/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMProfileTopViewPreview: PreviewProvider {

    static var previews: some View {
        VStack {
            SwiftUIPreview {
                CHMProfileTopView(
                    configuration: .basic(
                        imageKind: .url(.mockCake2),
                        userName: "Dmitriy Permyakov",
                        nickname: "@mightyK1ngRichard",
                        phone: "+7 (914) 432-324-34"
                    )
                ).with {
                    $0.backgroundColor = .grayDarkGray
                    $0.handlerConfiguration.imageTapHandler = {
                        print("Tap!")
                    }
                }
            }
            .fittingSize(width: .infinity)
            .previewDisplayName("Default")

            SwiftUIPreview {
                CHMProfileTopView(
                    configuration: .basic(
                        imageKind: .url(nil),
                        userName: "Dmitriy Permyakov",
                        nickname: "@mightyK1ngRichard"
                    )
                ).with {
                    $0.backgroundColor = .grayDarkGray
                    $0.handlerConfiguration.imageTapHandler = {
                        print("Tap!")
                    }
                }
            }
            .fittingSize(width: .infinity)
            .previewDisplayName("Default")
        }
    }
}
