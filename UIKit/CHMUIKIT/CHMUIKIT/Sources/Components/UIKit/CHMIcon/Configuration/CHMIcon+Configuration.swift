//
//  CHMIcon+Configuration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 08/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMIcon {

    struct Configuration {

        public typealias OwnerViewType = CHMIcon

        /// Icon image
        var image: UIImage?
        /// Icon color
        var color: UIColor = .clear
        /// Size of the view
        var iconSize: CGFloat = .zero
    }
}

// MARK: - IconKind

public extension CHMIcon.Configuration {
    
    /// Kind of the image
    enum IconKind: Hashable {
        case edit
        case house
        case bell
        case mapPin
        case person
        case plus
        case custom(UIImage?)
    }
}

public extension CHMIcon.Configuration.IconKind {

    var image: UIImage? {
        switch self {
        case .edit:
            return .imgPencil
        case .house:
            return .imgHome
        case .bell:
            return .imgBell
        case .mapPin:
            return .imgLocation
        case .person:
            return .imgPerson
        case .plus:
            return .plusSign
        case .custom(let img):
            return img
        }
    }
}
