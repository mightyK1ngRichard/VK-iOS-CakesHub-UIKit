//
//  CHMAvatarView+Defaults.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 02/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMAvatarView.Configuration {

    /// Basic configuration
    static let clear = CHMAvatarView.Configuration()

    /// Basic configuration
    /// - Parameters:
    ///   - imageKind: image kind
    ///   - imageSize: size of the image view
    ///   - ringWidth: line width of the ring
    /// - Returns: configuration of the view
    static func basic(
        _ imageKind: ImageKind,
        imageSize: CGFloat,
        ringColor: UIColor,
        ringWidth: CGFloat = 2
    ) -> CHMAvatarView.Configuration {
        modify(.clear) {
            $0.imageViewConfiguration = .imageConfiguration(imageKind)
            $0.imageSize = imageSize
            $0.ringWidth = ringWidth
            $0.ringColor = ringColor
        }
    }
}

// MARK: - CHMImageView Configuration

private extension CHMImageView.Configuration {

    static func imageConfiguration(_ kind: CHMAvatarView.Configuration.ImageKind) -> Self {
        switch kind {
        case .image(let image):
            .basic(
                .image(image, placeholder: .profile),
                imageKind: .capsule
            )
        case .url(let url):
            .basic(
                .url(url, placeholder: .profile),
                imageKind: .capsule
            )
        }
    }
}
