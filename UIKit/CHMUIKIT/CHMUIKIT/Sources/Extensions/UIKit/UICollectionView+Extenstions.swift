//
//  UICollectionView+Extenstions.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 06/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension UICollectionViewCell {

    static var defaultIdentifier = String(describing: "\(UICollectionViewCell.self)")
}

public extension UICollectionView {

    func defaultCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.defaultIdentifier, for: indexPath)
    }
}
