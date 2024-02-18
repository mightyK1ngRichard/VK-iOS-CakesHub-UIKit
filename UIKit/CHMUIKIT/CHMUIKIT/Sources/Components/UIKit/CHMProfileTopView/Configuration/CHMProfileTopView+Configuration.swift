//
//  CHMProfileTopView+Configuration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 02/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMProfileTopView {

    struct Configuration {

        public typealias OwnerViewType = CHMProfileTopView

        /// Configuration of the avatar image view
        public var avatarViewConfiguration: CHMAvatarView.Configuration = .clear
        /// Configuration of the user name label
        var userNameConfiguration: CHMLabel.Configuration = .clear
        /// Configuration of the user nickname label
        var nicknameConfiguration: CHMLabel.Configuration = .clear
        /// Configuration of the user phone number label
        var phoneNumberConfiguration: CHMLabel.Configuration = .clear
    }
}
