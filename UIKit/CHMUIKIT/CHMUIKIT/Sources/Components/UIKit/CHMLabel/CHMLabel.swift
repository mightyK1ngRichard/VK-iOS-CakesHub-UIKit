//
//  CHMLabel.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 23/10/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

/**
 Component `CHMLabel`

 For example:
 ```swift
 let label = CHMLabel(
     configuration: .custom(
         "MightyK1ngRichard",
         titleStyle: .elephant,
         alignment: .center
     )
 )
 ```
 */
public final class CHMLabel: UIView, Configurable {

    // MARK: Public Properties

    /// Configuration of the view
    public var configuration: Configuration {
        didSet {
            updateConfiguration()
        }
    }

    // MARK: Private UI Properties

    private lazy var label = UILabel().with {
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

private extension CHMLabel {

    func setup() {
        backgroundColor = .clear
        addSubview(label)
        addConstraints()
        updateConfiguration()
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func updateConfiguration() {
        label.applyConfiguration(configuration: configuration.labelConfiguration)
        label.numberOfLines = configuration.numberOfLines
        label.lineBreakMode = configuration.lineBreak
    }
}
