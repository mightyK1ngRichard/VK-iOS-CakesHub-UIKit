//
//  CHMButton.swift
//  CHMUIKIT
//
//  Created by Дмитрий Пермяков on 06.10.2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

/**
 Component `CHMButton`

 For example:
 ```swift
 let button = CHMButton(
     configuration: .basic(
         kind: .custom, title: "MightyK1ngRichard"
     )
 )
 ```
*/
public final class CHMButton: UIControl, Configurable {

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

    private let label = UILabel().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let backgroundView = CHMBackgroundView().with {
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

private extension CHMButton {

    func setup() {
        backgroundColor = .clear
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapView))
        addGestureRecognizer(gesture)
        addSubviews(backgroundView, label)
        addConstraints()
        updateConfiguration()
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),

            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func updateConfiguration() {
        backgroundView.configuration = configuration.backgroundConfiguration
        label.applyConfiguration(configuration: configuration.labelConfiguration)
    }

    func updateInteraction() {
        isUserInteractionEnabled = !handlerConfiguration.viewTapHandler.isNil
    }

    @objc
    func tapView() {
        handlerConfiguration.viewTapHandler?()
    }
}
