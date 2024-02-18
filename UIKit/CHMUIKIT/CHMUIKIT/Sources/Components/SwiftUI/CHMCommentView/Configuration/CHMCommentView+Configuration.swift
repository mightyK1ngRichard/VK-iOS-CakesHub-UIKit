//
//  CHMCommentView+Configuration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 27.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMCommentView {

    struct Configuration {

        public typealias OwnerViewType = CHMCommentView

        var userImageConfiguration: MKRImageView.Configuration = .clear
        var userName: String = .clear
        var date: String = .clear
        var starsConfiguration: CHMStarsView.Configuration = .clear
        var description: String = .clear
    }
}
