//
//  CHMPlusButton.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 11/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

/**
 Component `CHMPlusButton`

 For example:
 ```swift
 let plusButton = CHMPlusButton(
     configuration: .basic(.plus, size: CGSize(edge: 50))
 )
 ```
*/
public final class CHMPlusButton: UIView, Configurable {

    // MARK: Public Properties

    /// Configuration of the view
    public var configuration: Configuration {
        didSet {
            updateConfiguration()
        }
    }

    // MARK: Constraints

    private var circleWidth: NSLayoutConstraint!
    private var circleHeight: NSLayoutConstraint!
    private var plusWidth: NSLayoutConstraint!
    private var plusHeight: NSLayoutConstraint!

    // MARK: Private UI Properties

    private lazy var gradient = CAGradientLayer().with {
        let startColor = UIColor(hex: 0xEA4080)
        let endColor = UIColor(hex: 0xEE805F)
        $0.colors = [startColor.cgColor, endColor.cgColor]
        $0.startPoint = CGPoint(x: 0, y: 0)
        $0.endPoint = CGPoint(x: 1, y: 1)
        $0.locations = [-0.3, 1]
    }
    private lazy var circleView = UIView().with {
        $0.layer.addSublayer(gradient)
        $0.clipsToBounds = true
        $0.tintColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var plusView = UIImageView().with {
        $0.image = UIImage(bundleNamed: "plusSign")?.withTintColor(.white)
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
        bounds = .init(x: 0, y: 0, width: configuration.size.width, height: configuration.size.width)
    }
}

// MARK: - Private Methods

private extension CHMPlusButton {

    func setup() {
        backgroundColor = .clear
        addSubviews(circleView, plusView)
        addConstraints()
        updateConfiguration()
    }

    func addConstraints() {
        plusWidth = plusView.widthAnchor.constraint(equalToConstant: .zero)
        plusHeight = plusView.heightAnchor.constraint(equalToConstant: .zero)
        plusWidth.isActive = true
        plusHeight.isActive = true

        circleWidth = circleView.widthAnchor.constraint(equalToConstant: .zero)
        circleHeight = circleView.heightAnchor.constraint(equalToConstant: .zero)
        circleWidth.isActive = true
        circleHeight.isActive = true

        NSLayoutConstraint.activate([
            circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: centerYAnchor),
            plusView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            plusView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
        ])
    }

    func updateConfiguration() {
        let size = configuration.size.width

        circleWidth.constant = size
        circleHeight.constant = size
        
        plusWidth.constant = size / 2.53
        plusHeight.constant = size / 2.53

        gradient.frame = .init(origin: .zero, size: CGSize(edge: size))
        circleView.layer.cornerRadius = size.half

        plusView.transform = .init(rotationAngle: configuration.rotation)
    }
}
