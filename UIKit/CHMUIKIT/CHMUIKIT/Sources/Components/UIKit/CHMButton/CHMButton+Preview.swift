//
//  CHMButton.swift
//  CHMUIKIT
//
//  Created by Дмитрий Пермяков on 06.10.2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMButtonPreview: PreviewProvider {

    static var previews: some View {
        Group {
            SwiftUIPreview {
                CHMButton(
                    configuration: modify(.basic(kind: .cake, title: "Слово")) {
                        $0.backgroundConfiguration.bgColor = .red
                    }
                ).with {
                    $0.handlerConfiguration.viewTapHandler = {
                        print("Tap!")
                    }
                }
            }
            .previewDisplayName("Custom")
            .frame(width: .width, height: .height)

            SwiftUIPreview {
                CHMButton(
                    configuration: .basic(
                        kind: .custom,
                        title: "MightyK1ngRichard"
                    )
                ).with {
                    $0.handlerConfiguration.viewTapHandler = {
                        print("Tap!")
                    }
                }
            }
            .previewDisplayName("Custom")
            .frame(width: .width, height: .height)

            SwiftUIPreview {
                CHMButton(configuration: .basic(
                    kind: .bordered, title: "MightyK1ngRichard")
                ).with {
                    $0.handlerConfiguration.viewTapHandler = {
                        print("Tap!")
                    }
                }
            }
            .previewDisplayName("Bordered")
            .frame(width: .width, height: .height)

            SwiftUIPreview {
                CHMButton(configuration: .basic(
                    kind: .cakeBordered, title: "Продолжить")
                ).with {
                    $0.handlerConfiguration.viewTapHandler = {
                        print("Tap!")
                    }
                }
            }
            .frame(width: 200, height: 50)
            .previewDisplayName("Cake Bordered")
        }
    }
}

private extension CGFloat {

    static let width: CGFloat = 200
    static let height: CGFloat = 50
}
