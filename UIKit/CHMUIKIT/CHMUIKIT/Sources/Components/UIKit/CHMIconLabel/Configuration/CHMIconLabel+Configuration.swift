//
//  CHMIconLabel+Configuration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 08/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMIconLabel {

    struct Configuration {

        public typealias OwnerViewType = CHMIconLabel

        /// Configuration of the label view
        var labelConfiguration: CHMLabel.Configuration = .clear
        /// Configuration of the icon view
        var iconConfiguration: CHMIcon.Configuration = .clear
        /// Color of the selected label view
        var selectedLabelColor: UIColor = .clear
        /// Color of the unselected label view
        var unselectedLabelColor: UIColor = .clear
        /// Border selected color
        var borderColor: UIColor = .clear
        /// Border unselecred color
        var unselecredBorderColor: UIColor = .clear
    }
}
