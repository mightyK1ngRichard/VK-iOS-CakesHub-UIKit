//
//  CHMIcon.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 08/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

/**
 Component `CHMIcon`

 For example:
 ```swift
 let iconView = CHMIcon(
     configuration: .basic(.house, color: .purple)
 )
 ```
*/
public final class CHMIcon: UIView, Configurable {

    // MARK: Public Properties
    
    /// Configuration of the view
    public var configuration: Configuration {
        didSet {
            updateConfiguration()
        }
    }

    // MARK: Constraints

    var iconWidthAnchor: NSLayoutConstraint!
    var iconHeightAnchor: NSLayoutConstraint!

    // MARK: Private UI Properties

    private lazy var iconView = UIImageView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
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

private extension CHMIcon {

    func setup() {
        backgroundColor = .clear
        addSubview(iconView)
        addConstraints()
        updateConfiguration()
    }

    func addConstraints() {
        iconWidthAnchor = iconView.widthAnchor.constraint(equalToConstant: .zero)
        iconHeightAnchor = iconView.heightAnchor.constraint(equalToConstant: .zero)
        NSLayoutConstraint.activate([
            iconWidthAnchor,
            iconHeightAnchor,
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),

            topAnchor.constraint(equalTo: iconView.topAnchor),
            leadingAnchor.constraint(equalTo: iconView.leadingAnchor),
            trailingAnchor.constraint(equalTo: iconView.trailingAnchor),
            bottomAnchor.constraint(equalTo: iconView.bottomAnchor),
        ])
    }

    func updateConfiguration() {
        iconView.image = configuration.image?.withRenderingMode(.alwaysTemplate)
        iconView.tintColor = configuration.color
        iconWidthAnchor.constant = configuration.iconSize
        iconHeightAnchor.constant = configuration.iconSize
    }
}
