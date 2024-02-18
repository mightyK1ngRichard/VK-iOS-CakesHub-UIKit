//
//  CHMProfileButtonsBlock.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 02/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

/**
 Component `CHMProfileButtonsBlock`

 For example:
 ```swift
 let block = CHMProfileButtonsBlock(
     configuration: .basic(
         configurations: [
             .basic(title: "Редактировать профиль", imageKind: .profile),
             .basic(title: "Локация", imageKind: .location),
             .basic(title: "Уведомления", imageKind: .notification),
             .basic(title: "Feedback", imageKind: .feedback),
             .logout(title: "Выйти")
         ]
     )
 )
 ```
*/
public final class CHMProfileButtonsBlock: UIView, Configurable {

    // MARK: Public Properties
    
    /// Configuration of the view
    public var configuration: Configuration

    /// Handler configuration of the view
    public var handlerConfiguration: HandlerConfiguration

    // MARK: Private UI Properties

    private lazy var containerView = UIView().with { view in
        view.translatesAutoresizingMaskIntoConstraints = false
        let count = configuration.buttonConfigurations.count

        /// Первая кнопка
        guard let firstConfiguration = configuration.buttonConfigurations.first else { return }
        var firstButton = CHMIconTextView(configuration: firstConfiguration)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.handlerConfiguration.viewTapHandler = { [unowned self] view in
            handlerConfiguration.imageTapHandler?(view)
        }
        view.addSubview(firstButton)
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: view.topAnchor),
            firstButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        if count == 1 {
            firstButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            return
        }
        var oldButton = firstButton

        /// Центральные кнопки
        (1..<count-1).forEach { index in
            let button = CHMIconTextView(configuration: configuration.buttonConfigurations[index])
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)
            button.handlerConfiguration.viewTapHandler = { [unowned self] view in
                handlerConfiguration.imageTapHandler?(view)
            }
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: oldButton.bottomAnchor, constant: 24),
                button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                button.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
            oldButton = button
        }

        /// Последняя кнопка
        let lastButton = CHMIconTextView(configuration: configuration.buttonConfigurations[count - 1])
        lastButton.translatesAutoresizingMaskIntoConstraints = false
        lastButton.handlerConfiguration.viewTapHandler = { [unowned self] view in
            handlerConfiguration.imageTapHandler?(view)
        }
        view.addSubview(lastButton)
        NSLayoutConstraint.activate([
            lastButton.topAnchor.constraint(equalTo: oldButton.bottomAnchor, constant: 24),
            lastButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lastButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lastButton.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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

private extension CHMProfileButtonsBlock {

    func setup() {
        backgroundColor = .clear
        addSubview(containerView)
        addConstraints()
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
