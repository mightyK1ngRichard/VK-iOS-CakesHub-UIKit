//
//  UIDevice+Extenstions.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 03/12/2023.
//

import UIKit

extension UIDevice {

    static var isSe: Bool {
        self.current.name == "iPhone SE (3rd generation)"
    }
}
