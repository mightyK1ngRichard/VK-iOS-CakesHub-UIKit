//
//  CHMAvatarView+Configuration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 02/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMAvatarView {

    struct Configuration {

        public typealias OwnerViewType = CHMAvatarView

        /// Configuration of the image view
        public var imageViewConfiguration: CHMImageView.Configuration = .clear
        /// Width of the ringth
        var ringWidth: CGFloat = .zero
        /// Size of the view
        var imageSize: CGFloat = .zero
        /// Color of the ring
        var ringColor: UIColor = .clear
    }
}

// MARK: - ImageKind

public extension CHMAvatarView.Configuration {
    
    /// Kind of image source
    enum ImageKind: Hashable {
        case image(UIImage?)
        case url(URL?)
    }
}
