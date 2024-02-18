//
//  UILabel+Extensions.swift
//  CHMUIKIT
//
//  Created by Дмитрий Пермяков on 06.10.2023.
//

import UIKit

extension UILabel {

    func applyConfiguration(configuration: LabelConfiguration) {
        guard !configuration.attributedString.string.isEmpty else {
            attributedText = nil
            return
        }
        attributedText = configuration.attributedString
        numberOfLines = configuration.numberOfLines
        lineBreakMode = configuration.lineBreakMode
    }
}
