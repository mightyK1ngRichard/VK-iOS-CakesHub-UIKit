//
//  CHMLabel.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 23/10/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMLabel {

    struct Configuration {

        /// Configuration of the label
        public var labelConfiguration: LabelConfiguration = .clear
        /// Number of the lines
        var numberOfLines: Int = .zero
        /// Label line break
        var lineBreak: NSLineBreakMode = .byCharWrapping
    }
}
