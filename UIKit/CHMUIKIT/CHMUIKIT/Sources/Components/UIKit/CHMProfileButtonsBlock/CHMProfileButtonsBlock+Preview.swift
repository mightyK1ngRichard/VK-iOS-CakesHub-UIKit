//
//  CHMProfileButtonsBlock+Preview.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 02/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMProfileButtonsBlockPreview: PreviewProvider {

    static var previews: some View {
        Group {
            ProfileView([
                .basic(title: "Редактировать профиль", imageKind: .profile),
                .basic(title: "Локация", imageKind: .location),
                .basic(title: "Уведомления", imageKind: .notification),
                .basic(title: "Feedback", imageKind: .feedback),
                .logout(title: "Выйти")
            ])
            .previewDisplayName("Default")

            ProfileView([
                .basic(title: "Редактировать профиль", imageKind: .profile),
            ])
            .previewDisplayName("One button")

            ProfileView([
                .basic(title: "Редактировать профиль", imageKind: .profile),
                .basic(title: "Уведомления", imageKind: .notification),
            ])
            .previewDisplayName("Two buttons")
        }
    }
}

extension CHMProfileButtonsBlockPreview {

    static func ProfileView(_ data: [CHMIconTextView.Configuration]) -> some View {
        SwiftUIPreview {
            CHMProfileButtonsBlock(
                configuration: .basic(
                    configurations: data
                )
            ).with {
                $0.handlerConfiguration.imageTapHandler = { view in
                    print(view)
                }
            }
        }
        .fittingSize(width: .infinity)
        .padding(.horizontal)
    }
}
