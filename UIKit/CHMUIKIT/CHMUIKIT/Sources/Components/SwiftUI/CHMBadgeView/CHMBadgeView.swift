//
//  CHMBadgeView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 20.01.2024.
//

import SwiftUI

/**
Component `CHMBadgeView`

For example:
```swift
let badgeView = CHMBadgeView(
    configuration: .basic(text: "50%")
)
```
*/
public struct CHMBadgeView: View {

    let configuration: Configuration
    public var body: some View {
        Text(configuration.text)
            .font(
                .system(size: configuration.fontSize, weight: .semibold, design: .rounded)
            )
            .padding(configuration.backgroundEdges)
            .background(configuration.backgroundColor)
            .clipShape(.rect(cornerRadius: configuration.cornerRadius))
            .foregroundStyle(configuration.foregroundColor)
    }
}

// MARK: - Preview

#Preview {
    CHMBadgeView(configuration: .basic(text: "50%"))
}
