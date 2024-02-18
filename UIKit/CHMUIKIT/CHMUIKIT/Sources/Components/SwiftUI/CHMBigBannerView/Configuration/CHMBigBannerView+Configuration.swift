//
//  CHMBigBannerView+Configuration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 28.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMBigBannerView {

    final class ObservedConfiguration: ObservableObject {
        @Published public var configuration: Configuration = .clear
        public init() {}
    }

    struct Configuration {

        public typealias OwnerViewType = CHMBigBannerView

        /// Kind of the image source
        var imageKind: MKRImageView.Configuration.ImageKind = .clear
        /// Title of the banner
        var bannerTitle: String = .clear
        /// Title of the button
        var buttonTitle: String = .clear
    }
}
