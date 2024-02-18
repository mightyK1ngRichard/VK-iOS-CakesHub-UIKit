//
//  CHMBigBannerView+Defaults.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 28.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import Foundation

public extension CHMBigBannerView.Configuration {

    /// Basic configuration
    static let clear = CHMBigBannerView.Configuration()

    /// Basic configuration
    /// - Parameters:
    ///   - imageKind: image kind
    ///   - bannerTitle: title of the banner
    ///   - buttonTitle: title of the button
    /// - Returns: configuration of the view
    static func basic(
        imageKind: MKRImageView.Configuration.ImageKind,
        bannerTitle: String,
        buttonTitle: String
    ) -> Self {
        modify(.clear) {
            $0.imageKind = imageKind
            $0.bannerTitle = bannerTitle
            $0.buttonTitle = buttonTitle
        }
    }
}
