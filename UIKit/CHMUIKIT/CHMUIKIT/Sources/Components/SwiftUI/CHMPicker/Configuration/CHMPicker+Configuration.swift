//
//  CHMPicker+Configuration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 27.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

public extension CHMPicker {

    struct Configuration {

        public typealias OwnerViewType = CHMPicker
        
        /// Text of the component
        var text: String = .clear
        /// Color of the text
        var textColor: Color = .clear
        /// Selected color of the border
        var selectedBorderColor: Color = .clear
        /// Unselected color of the border
        var unselectedBorderColor: Color = .clear
        /// Color of the icon
        var iconColor: Color = .clear
    }
}
