//
//  CHMAddingCakeView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 11/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMAddingCakeView {

    struct Configuration {

        var imageViewConfiguration: CHMImageView.Configuration = .clear
        var backgroundViewConfiguration: CHMBackgroundView.Configuration = .clear
        var plusViewConfiguration: CHMPlusButton.Configuration = .clear
    }
}

// MARK: - Kind

public extension CHMAddingCakeView.Configuration {
    
    enum Kind: Hashable {
        case empty
        case image(ImageConfiguration.Kind)
    }
}
