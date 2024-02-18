//
//  CHMProfileTopView+Defaults.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 02/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

public extension CHMProfileTopView.Configuration {

    /// Basic configuration
    static let clear = CHMProfileTopView.Configuration()

    /// Basic configuration
    /// - Parameters:
    ///   - imageKind: image kind
    ///   - userName: user full name
    ///   - nickname: user nickname
    ///   - phone: user phone number
    /// - Returns: configuration of the view
    static func basic(
        imageKind: CHMAvatarView.Configuration.ImageKind,
        userName: String,
        nickname: String,
        phone: String? = nil
    ) -> CHMProfileTopView.Configuration {
        modify(.clear) {
            $0.avatarViewConfiguration = .avatarConfiguration(imageKind)
            $0.userNameConfiguration = .userNameConfiguration(userName)
            $0.nicknameConfiguration = .nicknameConfiguration(nickname)
            if let phone {
                $0.phoneNumberConfiguration = .phoneConfiguration(phone)
            }
        }
    }
}

// MARK: - CHMAvatarView Configuration

private extension CHMAvatarView.Configuration {

    static func avatarConfiguration(_ imageKind: CHMAvatarView.Configuration.ImageKind) -> Self {
        switch imageKind {
        case .image(let image):
                .basic(
                    .image(image),
                    imageSize: .imageSize,
                    ringColor: .orangeBorder,
                    ringWidth: .ringWidth
                )
        case .url(let url):
                .basic(
                    .url(url),
                    imageSize: .imageSize,
                    ringColor: .orangeBorder,
                    ringWidth: .ringWidth
                )
        }
    }
}

// MARK: - CHMLabel Configuration

private extension CHMLabel.Configuration {

    static func userNameConfiguration(_ name: String) -> Self {
        .custom(
            name,
            titleStyle: .semibold17,
            textColor: .primary,
            alignment: .left,
            numberOfLines: .maxNumberOfLines,
            lineBreak: .byWordWrapping
        )
    }

    static func nicknameConfiguration(_ nickname: String) -> Self {
        .custom(
            nickname,
            titleStyle: .regular11,
            textColor: .orangeBorder,
            alignment: .left,
            numberOfLines: .minNumberOfLines,
            lineBreak: .byCharWrapping
        )
    }

    static func phoneConfiguration(_ phone: String) -> Self {
        .custom(
            phone,
            titleStyle: .regular11,
            textColor: .primary,
            alignment: .left,
            numberOfLines: .minNumberOfLines,
            lineBreak: .byCharWrapping
        )
    }
}

// MARK: - Constants

private extension CGFloat {

    static let imageSize: CGFloat = 80
    static let ringWidth: CGFloat = 2
}

private extension Int {

    static let maxNumberOfLines: Int = 2
    static let minNumberOfLines: Int = 1
}
