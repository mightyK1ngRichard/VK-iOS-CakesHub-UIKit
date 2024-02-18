//
//  CGSize+Ext.swift
//  CakeHubApplication
//
//  Created by Дмитрий Пермяков on 04.10.2023.
//

import UIKit

extension CGSize {

    init(edge: CGFloat) {
        self.init(width: edge, height: edge)
    }
}

extension CGSize: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(width)
        hasher.combine(height)
    }
}
