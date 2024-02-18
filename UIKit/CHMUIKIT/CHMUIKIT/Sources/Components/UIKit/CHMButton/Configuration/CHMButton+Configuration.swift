
//
//  CHMButton.swift
//  CHMUIKIT
//
//  Created by Дмитрий Пермяков on 06.10.2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMButton {

    struct Configuration {

        /// Configuration of the backgroundView
       public var backgroundConfiguration: CHMBackgroundView.Configuration = .clear
        /// Configuration of the label
        public var labelConfiguration: LabelConfiguration = .clear
    }
}



public extension CHMButton.Configuration {
    
    /// Button kind
    enum Kind {
        case custom
        case cake
        case cakeBordered
        case bordered
    }
}
