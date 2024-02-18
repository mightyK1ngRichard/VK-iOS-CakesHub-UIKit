//
//  CHMIconTextView+Configuration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 02/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMIconTextView {

    struct Configuration {

        public typealias OwnerViewType = CHMIconTextView

        /// Configuration of the title view
        public var titleConfiguration: CHMLabel.Configuration = .clear
        /// Image of the icon view
        var image: UIImage?
        /// Tint color of the icon view
        var tintColor: UIColor = .clear
        /// Color of the stroke
        var borderColor: UIColor = .clear
    }
}

// MARK: - ImageKind

public extension CHMIconTextView.Configuration {
    
    /// Kind of the image of the icon view
    enum ImageKind: Hashable {
        case profile
        case location
        case notification
        case announcement
        case feedback
        case logout
    }
}

extension CHMIconTextView.Configuration.ImageKind {

    var image: UIImage? {
        switch self {
        case .profile:
            return .imgPerson
        case .announcement:
            return .imgCake
        case .location:
            return .imgLocation
        case .notification:
            return .imgBell
        case .feedback:
            return .imgFeedback
        case .logout:
            return .imgLogout
        }
    }
}
