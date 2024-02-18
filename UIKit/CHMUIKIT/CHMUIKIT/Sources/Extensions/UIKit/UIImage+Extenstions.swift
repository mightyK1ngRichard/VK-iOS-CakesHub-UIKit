//
//  UIImage+Extenstions.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 11/11/2023.
//

import UIKit.UIImage

extension UIImage {

    convenience init?(bundleNamed name: String) {
        self.init(named: name, in: Bundle.module, compatibleWith: nil)
    }
}
