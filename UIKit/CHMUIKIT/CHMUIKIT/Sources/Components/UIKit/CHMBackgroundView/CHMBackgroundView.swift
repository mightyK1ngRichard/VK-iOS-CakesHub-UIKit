//
//  CHMBackgroundView.swift
//  CHMUIKIT
//
//  Created by Дмитрий Пермяков on 06.10.2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

/**
 Component `CHMBackgroundView`

 For example:
 ```swift
 let backgroundView = CHMBackgroundView(
     configuration: .basic(
         kind: .Rectangle(
             color: .green,
             cornerRadius: 20,
             borderWidth: 2,
             borderColor: .red
         )
     )
 )
 ```
*/
public final class CHMBackgroundView: UIView, Configurable {

    /// Configuration of the view
    public var configuration: Configuration {
        didSet {
            updateConfiguration()
        }
    }

    // MARK: Private UI Properties

    private lazy var backgroundView = UIView()

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
        switch configuration.kind {
        case .circle:
            layer.cornerRadius = bounds.width / .divider
        default:
            layer.cornerRadius = configuration.bgCornerRadius
        }
    }
}

// MARK: - Private Methods

private extension CHMBackgroundView {

    func setup() {
        backgroundColor = .clear
        addSubview(backgroundView)
        addConstraints()
        updateConfiguration()
    }

    func addConstraints() {
        backgroundView.frame = bounds
    }

    func updateConfiguration() {
        backgroundColor = configuration.bgColor
        layer.borderWidth = configuration.borderWidth
        layer.borderColor = configuration.borderColor.cgColor
    }
}

// MARK: - Constants

private extension CGFloat {

    static let divider: CGFloat = 2
}
