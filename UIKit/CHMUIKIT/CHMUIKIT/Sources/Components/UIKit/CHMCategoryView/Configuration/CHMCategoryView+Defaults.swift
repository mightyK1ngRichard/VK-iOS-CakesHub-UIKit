//
//  CHMCategoryView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 06/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMCategoryView.Configuration {

    /// Basic design configuration
    static let clear = CHMCategoryView.Configuration()

    /// Basic design configuration
    /// - Parameters:
    ///   - url: image url
    ///   - title: title of the catigory
    /// - Returns: designed configuration
    static func basic(
        _ url: URL?,
        title: String
    ) -> CHMCategoryView.Configuration {
        modify(.clear) {
            $0.imageViewConfiguration = .basic(
                .url(url, placeholder: .cake),
                imageKind: .static(.cornerRadius)
            )
            $0.titleConfiguration = .custom(
                title,
                titleStyle: .semibold13,
                textColor: .whiteConst,
                alignment: .left,
                numberOfLines: .numberOfLines
            )
        }
    }
}

// MARK: - Constants

private extension CGFloat {

    static let cornerRadius: CGFloat = 8
}

private extension Int {

    static let numberOfLines = 2
}
