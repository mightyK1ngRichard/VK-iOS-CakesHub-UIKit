//
//  CHMImageView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 10/10/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMImageView {

    struct Configuration {
        
        /// Kind of the image view shape
        var imageKind: Kind = .square
        /// Kind of the image view
        public var imageConfiguration: ImageConfiguration = .clear
        /// Configuration of the background view
        var backgroundConfiguration: CHMBackgroundView.Configuration = .clear
    }
}

// MARK: - Kind

public extension CHMImageView.Configuration {
    
    /// Kind of the image shape
    enum Kind: Hashable {
        case capsule
        case `static`(CGFloat)
        case square
    }
}
