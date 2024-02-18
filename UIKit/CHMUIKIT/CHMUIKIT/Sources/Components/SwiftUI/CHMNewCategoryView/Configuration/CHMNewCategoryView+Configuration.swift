//
//  CHMNewCategoryView+Configuration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 27.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMNewCategoryView {

    struct Configuration {

        public typealias OwnerViewType = CHMNewCategoryView

        /// Configuration of the image view
        var imageKindConfiguration: MKRImageView.Configuration.ImageKind = .image(nil)
        var title: String = .clear
    }
}
