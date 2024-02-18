//
//  CHMIconLabel.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 08/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

/**
 Component `CHMIconLabel`

 For example:
 ```swift
 let view = CHMLabel(
     configuration: .basic(
         .mockLoadingUrl,
         imageKind: .capsule
     )
 )
 ```
*/
public final class CHMIconLabel: UIControl, Configurable {

    // MARK: Public Properties
    
    /// Configuration of the view
    public var configuration: Configuration {
        didSet {
            updateConfiguration()
        }
    }
    
    /// State configuration
    public override var isSelected: Bool {
        didSet {
            updateConfiguration()
        }
    }

    // MARK: Private UI Properties

    private lazy var titleView = CHMLabel().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var iconView = CHMIcon().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: Lifecycle

    public init(configuration: Configuration = .clear) {
        self.configuration = configuration
        super.init(frame: .zero)
        setup()
    }

    public override init(frame: CGRect) {
        self.configuration = .clear
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        self.configuration = .clear
        super.init(coder: coder)
        setup()
    }
}

// MARK: - Private Methods

private extension CHMIconLabel {

    func setup() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        addGestureRecognizer(gesture)
        backgroundColor = .clear
        layer.cornerRadius = 16
        layer.borderWidth = 1
        addSubviews(iconView, titleView)
        addConstraints()
        updateConfiguration()
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            iconView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),

            titleView.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 4),
            titleView.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            titleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            titleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
        ])
    }

    func updateConfiguration() {
        iconView.configuration = configuration.iconConfiguration
        titleView.configuration = configuration.labelConfiguration
        layer.borderColor = isSelected ? configuration.borderColor.cgColor : configuration.unselecredBorderColor.cgColor
    }

    // MARK: Actions

    @objc
    func viewTapped() {
        isSelected.toggle()
    }
}
