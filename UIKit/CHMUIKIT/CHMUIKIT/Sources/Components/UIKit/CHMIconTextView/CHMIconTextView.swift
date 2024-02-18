//
//  CHMIconTextView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 02/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

/**
 Component `CHMIconTextView`

 For example:
 ```swift
 let view = CHMIconTextView(
     configuration: .basic(
         title: "Редактировать профиль",
         imageKind: .profile
     )
 )
 ```
*/
public final class CHMIconTextView: UIView, Configurable {

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
            updateInteraction()
        }
    }

    // MARK: Private UI Properties

    private lazy var iconView = UIImageView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.widthAnchor.constraint(equalToConstant: .iconSize).isActive = true
        $0.heightAnchor.constraint(equalToConstant: .iconSize).isActive = true
    }
    private lazy var titleView = CHMLabel().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
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

private extension CHMIconTextView {

    func setup() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapView))
        addGestureRecognizer(gesture)
        backgroundColor = .grayLightGray
        layer.cornerRadius = .cornerRadius
        layer.borderWidth = .borderWidth
        addSubviews(iconView, titleView)
        addConstraints()
        updateConfiguration()
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: iconView.topAnchor, constant: -.vPadding),
            bottomAnchor.constraint(equalTo: iconView.bottomAnchor, constant: .vPadding),

            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .hPadding),

            titleView.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: .hPadding),
            titleView.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.hPadding)
        ])
    }

    func updateConfiguration() {
        titleView.configuration = configuration.titleConfiguration
        iconView.image = configuration.image?.withRenderingMode(.alwaysTemplate)
        iconView.tintColor = configuration.tintColor
        layer.borderColor = configuration.borderColor.cgColor
    }

    func updateInteraction() {
        isUserInteractionEnabled = !handlerConfiguration.viewTapHandler.isNil
    }

    // MARK: Action

    @objc
    func tapView() {
        handlerConfiguration.viewTapHandler?(self)
    }
}

// MARK: - Constants

private extension CGFloat {

    static var hPadding: CGFloat = 24
    static var vPadding: CGFloat = 18
    static var iconSize: CGFloat = 24
    static var cornerRadius: CGFloat = 8
    static var borderWidth: CGFloat = 1
}
