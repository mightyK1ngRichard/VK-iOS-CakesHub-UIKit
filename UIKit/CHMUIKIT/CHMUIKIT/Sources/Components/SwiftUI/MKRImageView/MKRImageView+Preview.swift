//
//  MKRImageView+Preview.swift
//  MKRDesignSystem
//
//  Created by Dmitriy Permyakov on 20.01.2024.
//

import SwiftUI

struct MKRImageView_Previews: PreviewProvider {

    static var previews: some View {
        VStack(spacing: 20) {
            MKRImageView(
                configuration: .basic(
                    kind: .url(.mockCake2),
                    imageSize: CGSize(width: 150, height: 150),
                    imageShape: .capsule
                )
            )
            .previewDisplayName("Circle")

            MKRImageView(
                configuration: .basic(
                    kind: .url(.mockCake2),
                    imageSize: CGSize(width: 150, height: 150),
                    imageShape: .rectangle
                )
            )
            .previewDisplayName("Rectangle")
            
            MKRImageView(
                configuration: .basic(
                    kind: .url(.mockCake2),
                    imageSize: CGSize(width: 150, height: 150),
                    imageShape: .roundedRectangle(20)
                )
            )
            .previewDisplayName("RoundedRectangle")
        }
    }
}
