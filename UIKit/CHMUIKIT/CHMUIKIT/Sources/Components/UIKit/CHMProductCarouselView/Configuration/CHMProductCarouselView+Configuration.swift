//
//  CHMProductCarouselView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 06/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMProductCarouselView {

    struct Configuration {

        /// Photo url array
        var images: [URL?] = []
        /// Images kind
        var kind: Kind = .url([])
    }
}

public extension CHMProductCarouselView.Configuration {
    
    /// Images kind
    enum Kind: Hashable {
        case url([URL?])
        case image([UIImage?])
    }
}

public extension CHMProductCarouselView.Configuration.Kind {

    var count: Int {
        switch self {
        case .url(let urls):
            return urls.count
        case .image(let imgs):
            return imgs.count
        }
    }
}
