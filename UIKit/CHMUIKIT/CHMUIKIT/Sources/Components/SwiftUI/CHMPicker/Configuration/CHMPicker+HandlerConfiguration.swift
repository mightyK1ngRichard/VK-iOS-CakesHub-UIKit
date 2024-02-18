//
//  CHMPicker.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 27.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import Foundation

public extension CHMPicker {

    struct HandlerConfiguration {
        var didTapView: CHMBoolBlock?

        public init(didTapView: CHMBoolBlock? = nil) {
            self.didTapView = didTapView
        }
    }
}
