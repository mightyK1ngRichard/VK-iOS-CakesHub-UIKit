//
//  CHMCardBadge.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 01.02.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import UIKit

/**
 Component `CHMCardBadge`

 For example:
 ```swift
 let view = CHMCardBadge(
     configuration: .basic(kind: .dark, text: "-20%")
 )
 ```
*/
public final class CHMCardBadge: UIView {

    // MARK: Public Properties
    
    /// Configuration of the view
    public var configuration: Configuration {
        didSet {
            updateConfiguration()
        }
    }

    // MARK: Private UI Properties

    private lazy var labelView = CHMLabel().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var backgroundView = UIView().with {
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

    public override func layoutSubviews() {
        super.layoutSubviews()
        backgroundView.layer.cornerRadius = backgroundView.bounds.height.half
        backgroundView.backgroundColor = configuration.backgroundColor
    }
}

// MARK: - Private Methods

private extension CHMCardBadge {

    func setup() {
        backgroundColor = .clear
        addSubviews(backgroundView, labelView)
        addConstraints()
        updateConfiguration()
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 7),
            labelView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 5),
            labelView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -6),
            labelView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -6),

            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func updateConfiguration() {
        labelView.configuration = configuration.labelConfiguration
    }
}
