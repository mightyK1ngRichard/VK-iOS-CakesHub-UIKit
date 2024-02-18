//
//  UIImage+Additions.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 02/12/2023.
//

import UIKit
import SwiftUI

public extension UIImage? {

    static var imgPerson: UIImage? { UIImage(bundleNamed: "person-icon") }
    static var starFill: UIImage? { UIImage(bundleNamed: "StarFill") }
    static var starOutline: UIImage? { UIImage(bundleNamed: "StarOutline") }
    static var basketIcon: UIImage? { UIImage(bundleNamed: "basketIcon") }
    static var favoriteBorder: UIImage? { UIImage(bundleNamed: "favorite_border") }
    static var favoritePressed: UIImage? { UIImage(bundleNamed: "favorite_pressed") }
    static var chevronDown: UIImage? { UIImage(bundleNamed: "chevron-down") }
    static var imgHome: UIImage? { UIImage(bundleNamed: "home") }
    static var imgPencil: UIImage? { UIImage(bundleNamed: "pencil-square") }
    static var imgLocation: UIImage? { UIImage(bundleNamed: "map-pin") }
    static var imgBell: UIImage? { UIImage(bundleNamed: "bell") }
    static var imgFeedback: UIImage? { UIImage(bundleNamed: "feedback") }
    static var imgLogout: UIImage? { UIImage(bundleNamed: "logout") }
    static var imgCake: UIImage? { UIImage(systemName: "birthday.cake.fill") }
    static var plusSign: UIImage? { UIImage(systemName: "plusSign") }
}

// MARK: - Categories

public extension UIImage? {
    
    static var category_1: UIImage? { UIImage(bundleNamed: "category-1") }
    static var category_2: UIImage? { UIImage(bundleNamed: "category-2") }
    static var category_3: UIImage? { UIImage(bundleNamed: "category-3") }
}

// MARK: - Image

public extension Image {

    static var basketIcon = Image(uiImage: UIImage(bundleNamed: "basketIcon")!)
    static var starFill = Image(uiImage: UIImage(bundleNamed: "StarFill")!)
    static var chevronDown = Image(uiImage: UIImage(bundleNamed: "chevron-down")!)
    static var favoriteBorder = Image(uiImage: UIImage(bundleNamed: "favorite_border")!)
    static var favoritePressed = Image(uiImage: UIImage(bundleNamed: "favorite_pressed")!)
    static var starOutline = Image(uiImage: UIImage(bundleNamed: "StarOutline")!)
}
