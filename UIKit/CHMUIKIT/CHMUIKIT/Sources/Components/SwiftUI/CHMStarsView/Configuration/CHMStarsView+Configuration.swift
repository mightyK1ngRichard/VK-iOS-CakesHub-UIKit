//
//  CHMStarsView+Configuration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 20.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

public extension CHMStarsView {

    struct Configuration {

        public typealias OwnerViewType = CHMStarsView

        /// Count of the fill star
        var countFillStars: Int = .zero
        /// Width of the star
        var starWidth: CGFloat = .zero
        /// Padding between stars
        var padding: CGFloat = .zero
        /// Count of the feedback
        var feedbackCount: Int?
        /// Color of the text
        var foregroundColor: Color = .clear
        /// Text line heigth
        var lineHeigth: CGFloat = .zero
        /// Padding between text and stars
        var leftPadding: CGFloat = .zero
    }
}

// MARK: - Kind

extension CHMStarsView.Configuration {
    
    /// Kind of stars block
    public enum Kind: Int {
        case zero = 0
        case one
        case two
        case three
        case four
        case five
    }
}
