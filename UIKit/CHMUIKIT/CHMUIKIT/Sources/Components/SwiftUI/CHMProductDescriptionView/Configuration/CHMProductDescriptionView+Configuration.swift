//
//  CHMProductDescriptionView+Configuration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 26.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

public extension CHMProductDescriptionView {

    struct Configuration {

        public typealias OwnerViewType = CHMProductDescriptionView

        /// Product title
        var title: String = .clear
        /// Product price
        var price: String = .clear
        /// Product subtitle
        var subtitle: String = .clear
        /// Product description
        var description: String = .clear
        /// View horizonral padding
        var innerHPadding: CGFloat = .zero
        /// Configurations of the stars
        var starsConfiguration: CHMStarsView.Configuration = .clear
    }
}

// MARK: - PickerItem

extension CHMProductDescriptionView.Configuration {

    struct PickerItem: Identifiable {
        let id: Int
        var title: String

        static func basic(id: Int, title: String) -> Self {
            .init(id: id, title: title)
        }
    }
}
