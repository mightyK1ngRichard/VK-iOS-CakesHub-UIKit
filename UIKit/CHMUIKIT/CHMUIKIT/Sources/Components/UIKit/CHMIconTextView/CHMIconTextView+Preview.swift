//
//  CHMIconTextView+Preview.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 02/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMIconTextViewPreview: PreviewProvider {

    static var previews: some View {
        VStack {
            SwiftUIPreview {
                CHMIconTextView(
                    configuration: .basic(
                        title: "Редактировать профиль",
                        imageKind: .profile
                    )
                ).with {
                    $0.handlerConfiguration.viewTapHandler = { view in
                        print("Tap view: \(view.configuration.titleConfiguration.labelConfiguration.attributedString.string)")
                    }
                }
            }
            .fittingSize(width: .infinity)

            SwiftUIPreview {
                CHMIconTextView(
                    configuration: .logout(
                        title: "Выйти"
                    )
                )
            }
            .fittingSize(width: .infinity)
        }
        .previewDisplayName("Default")
    }
}
