//
//  CHMAddingCakeView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 11/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

/**
 Component `CHMAddingCakeView`

 For example:
 ```swift
 let addingCard = CHMAddingCakeView(
     configuration: .basic(
         .image(.url(.mockCake1, placeholder: .cake))
     )
 )
 ```
*/
public final class CHMAddingCakeView: UIView, Configurable {

    // MARK: Public Properties

    /// Configuration of the view
    public var configuration: Configuration {
        didSet {
            updateConfiguration()
        }
    }

    /// Handler configuration of the view
    public var handlerConfiguration: HandlerConfiguration

    // MARK: Private UI Properties

    private lazy var imageView = CHMImageView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var plusView = CHMPlusButton().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var backgroundView = CHMBackgroundView().with {
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

private extension CHMAddingCakeView {

    func setup() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        addGestureRecognizer(gesture)
        backgroundColor = .clear
        addSubviews(backgroundView, imageView, plusView)
        addConstraints()
        updateConfiguration()
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .trailingPadding),
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .bottomPadding),

            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .trailingPadding),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .bottomPadding),

            plusView.trailingAnchor.constraint(equalTo: trailingAnchor),
            plusView.bottomAnchor.constraint(equalTo: bottomAnchor),

            plusView.centerXAnchor.constraint(equalTo: plusView.centerXAnchor),
            plusView.centerYAnchor.constraint(equalTo: plusView.centerYAnchor),
        ])
    }

    func updateConfiguration() {
        backgroundView.configuration = configuration.backgroundViewConfiguration
        imageView.configuration = configuration.imageViewConfiguration
        plusView.configuration = configuration.plusViewConfiguration
    }

    // MARK: Actions

    @objc
    func viewTapped() {
        handlerConfiguration.actionCardTapHandler?()
    }
}

// MARK: - Constants

private extension CGFloat {

    static let circleSize: CGFloat = 31
    static let trailingPadding: CGFloat = -8
    static let bottomPadding: CGFloat = -8
}
