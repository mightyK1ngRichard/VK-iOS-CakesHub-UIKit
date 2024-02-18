//
//  CHMProfileTopView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 02/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

/**
 Component `CHMProfileTopView`

 For example:
 ```swift
 let profile = CHMProfileTopView(
     configuration: .basic(
         imageKind: .url(.mockCake3),
         userName: "Dmitriy Permyakov",
         nickname: "@mightyK1ngRichard"
     )
 )
 ```
*/
public final class CHMProfileTopView: UIView, Configurable {

    // MARK: Public Properties
    
    /// Configuration of the view
    public var configuration: Configuration {
        didSet {
            updateConfiguration()
        }
    }
    
    /// Handler configuration of the view
    public var handlerConfiguration: HandlerConfiguration {
        didSet {
            updateHandler()
        }
    }

    // MARK: Private UI Properties

    private lazy var avatarView = CHMAvatarView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var userNameView = CHMLabel().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var nicknameView = CHMLabel().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var phoneNumberView = CHMLabel().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var titleSubtitleContainer = UIView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubviews(userNameView, nicknameView, phoneNumberView)

        NSLayoutConstraint.activate([
            userNameView.topAnchor.constraint(equalTo: $0.topAnchor),
            userNameView.leadingAnchor.constraint(equalTo: $0.leadingAnchor),
            userNameView.trailingAnchor.constraint(equalTo: $0.trailingAnchor),

            nicknameView.topAnchor.constraint(equalTo: userNameView.bottomAnchor, constant: .labelVPadding),
            nicknameView.leadingAnchor.constraint(equalTo: $0.leadingAnchor),
            nicknameView.trailingAnchor.constraint(equalTo: $0.trailingAnchor),

            phoneNumberView.topAnchor.constraint(equalTo: nicknameView.bottomAnchor, constant: .labelVPadding),
            phoneNumberView.leadingAnchor.constraint(equalTo: $0.leadingAnchor),
            phoneNumberView.trailingAnchor.constraint(equalTo: $0.trailingAnchor),
            phoneNumberView.bottomAnchor.constraint(equalTo: $0.bottomAnchor)
        ])
    }

    // MARK: Lifecycle

    public init(
        configuration: Configuration = .clear,
        handlerConfiguration: HandlerConfiguration = .clear
    ) {
        self.configuration = configuration
        self.handlerConfiguration = handlerConfiguration
        super.init(frame: .zero)
        setup()
    }

    public override init(frame: CGRect) {
        self.configuration = .clear
        self.handlerConfiguration = .clear
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        self.configuration = .clear
        self.handlerConfiguration = .clear
        super.init(coder: coder)
        setup()
    }
}

// MARK: - Private Methods

private extension CHMProfileTopView {

    func setup() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(imageTap))
        avatarView.addGestureRecognizer(gesture)
        backgroundColor = .clear
        addSubviews(avatarView, titleSubtitleContainer)
        addConstraints()
        updateConfiguration()
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            avatarView.topAnchor.constraint(equalTo: topAnchor),
            avatarView.leadingAnchor.constraint(equalTo: leadingAnchor),
            avatarView.bottomAnchor.constraint(equalTo: bottomAnchor),

            titleSubtitleContainer.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleSubtitleContainer.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: .containerPadding),
            titleSubtitleContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.containerPadding)
        ])
    }

    func updateConfiguration() {
        avatarView.configuration = configuration.avatarViewConfiguration
        userNameView.configuration = configuration.userNameConfiguration
        nicknameView.configuration = configuration.nicknameConfiguration
        phoneNumberView.configuration = configuration.phoneNumberConfiguration
    }

    func updateHandler() {
        isUserInteractionEnabled = !handlerConfiguration.imageTapHandler.isNil
    }

    // MARK: Actions

    @objc
    func imageTap() {
        handlerConfiguration.imageTapHandler?()
    }
}

// MARK: - Constants

private extension CGFloat {

    static var containerPadding: CGFloat = 10
    static var labelVPadding: CGFloat = 5
}
