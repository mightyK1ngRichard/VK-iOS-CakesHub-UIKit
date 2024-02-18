//
//  CGFloat+Extentions.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 27.12.2023.
//

import Foundation

extension CGFloat {

    var toString: String { "\(self)" }
}

// MARK: - Maths

extension CGFloat {

    func rounded(toPlaces places: Int) -> CGFloat {
        let divisor = pow(10.0, CGFloat(places))
        return (self * divisor).rounded() / divisor
    }
}
