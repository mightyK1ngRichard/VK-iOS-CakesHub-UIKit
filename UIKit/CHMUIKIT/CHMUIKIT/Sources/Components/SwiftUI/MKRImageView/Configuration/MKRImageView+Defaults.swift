//
//  MKRImageView+Defaults.swift
//  MKRDesignSystem
//
//  Created by Dmitriy Permyakov on 31.12.2023.
//

import Foundation

public extension MKRImageView.Configuration {

    static let clear = Self()

    static func basic(
        kind: ImageKind,
        imageSize: CGSize,
        imageShape: ImageShape
    ) -> Self {
        modify(.clear) {
            $0.kind = kind
            $0.imageSize = imageSize
            $0.imageShape = imageShape
        }
    }
}
