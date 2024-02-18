//
//  CHMPlusButton.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 11/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMPlusButton {

    struct Configuration {
        
        /// Kind of the button
        var kind: Kind = .plus
        /// Size of the button
        var size: CGSize = .zero
        /// Rotation of the image view
        var rotation: CGFloat = .zero
    }
}

// MARK: - Kind

public extension CHMPlusButton.Configuration {
    
    /// Kind of button
    enum Kind: Hashable {
        case plus
        case close
    }
}

public extension CHMPlusButton.Configuration.Kind {

    var rotation: CGFloat {
        switch self {
        case .plus:
            return .zero
        case .close:
            return -40.1
        }
    }
}
