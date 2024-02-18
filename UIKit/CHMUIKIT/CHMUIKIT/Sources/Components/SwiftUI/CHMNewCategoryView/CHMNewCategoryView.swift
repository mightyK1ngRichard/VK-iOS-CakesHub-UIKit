//
//  CHMNewCategoryView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 27.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

/**
 Component `CHMNewCategoryView`

 For example:
 ```swift
 let view = CHMNewCategoryView(
     configuration: .constant(
         .basic(
             imageKind: .url(.mockCake1),
             title: "Clothes"
         )
     )
 )
 ```
*/
public struct CHMNewCategoryView: View {

    let configuration: Configuration

    public var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            HStack {
                Text(configuration.title)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(Color.textPrimary)
                    .padding(.leading, 23)
                Spacer()
                MKRImageView(configuration: .basic(
                    kind: configuration.imageKindConfiguration,
                    imageSize: CGSize(width: size.width.half, height: size.height),
                    imageShape: .rectangle
                ))
            }
        }
        .frame(height: 100)
        .background(Color.bgCommentView)
        .clippedShape(.roundedRectangle(8))
    }
}

// MARK: - Preview

#Preview {
    CHMNewCategoryView(
        configuration: .basic(
            imageKind: .url(.mockCake2),
            title: "Clothes"
        )
    )
    .padding()
    .background(Color.bgPreview)
}
