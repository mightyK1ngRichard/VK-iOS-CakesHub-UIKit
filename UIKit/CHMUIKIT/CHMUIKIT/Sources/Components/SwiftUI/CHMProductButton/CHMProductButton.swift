//
//  CHMProductButton.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 20.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

/**
Component `CHMProductButton`

For example:
```swift
let view = CHMProductButton(
    configuration: .basic(kind: .basket)
)
```
*/
public struct CHMProductButton: View {

    let configuration: Configuration
    var didTapButton: CHMVoidBlock?

    public var body: some View {
        ZStack {
            Circle()
                .fill(configuration.backgroundColor)
                .frame(edge: configuration.buttonSize)

            Button {
                didTapButton?()
            } label: {
                configuration.iconImage
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: configuration.iconSize)
                    .foregroundStyle(configuration.iconColor)
            }
        }
        .shadow(color: configuration.shadowColor, radius: 10)
    }
}

// MARK: - Preview

#Preview {
    CHMProductButton(
        configuration: .basic(kind: .basket)
    )
}
