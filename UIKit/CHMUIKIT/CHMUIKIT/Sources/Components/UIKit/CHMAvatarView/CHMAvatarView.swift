//
//  CHMAvatarView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 02/12/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

/**
 Component `CHMAvatarView`

 For example:
 ```swift
 let avatar = CHMAvatarView(
     configuration: .basic(
         .url(.mockLoadingUrl),
         imageSize: 300,
         ringColor: .orange,
         ringWidth: 8
     )
 )
 ```
*/
public final class CHMAvatarView: UIView, Configurable {

    // MARK: Public Properties
    
    /// Configuration of the view
    public var configuration: Configuration {
        didSet {
            updateConfiguration()
        }
    }

    // MARK: Private UI Properties

    private lazy var imageView = CHMImageView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: Constraints

    private var imageWidthAnchor: NSLayoutConstraint!
    private var imageHeightAnchor: NSLayoutConstraint!
    private var viewWidthAnchor: NSLayoutConstraint!
    private var viewHeightAnchor: NSLayoutConstraint!

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

    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let ringLineWidth: CGFloat = configuration.ringWidth
        let radius = min(rect.width, rect.height) / 2 - ringLineWidth

        let ringPath = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: 0,
            endAngle: 2 * .pi,
            clockwise: true
        )
        ringPath.lineWidth = ringLineWidth
        configuration.ringColor.setStroke()
        ringPath.stroke()
    }
}

// MARK: - Private Methods

private extension CHMAvatarView {

    func setup() {
        backgroundColor = .clear
        addSubview(imageView)
        addConstraints()
        updateConfiguration()
    }

    func addConstraints() {
        imageWidthAnchor = imageView.widthAnchor.constraint(equalToConstant: .zero)
        imageHeightAnchor = imageView.heightAnchor.constraint(equalToConstant: .zero)
        viewWidthAnchor = widthAnchor.constraint(equalToConstant: .zero)
        viewHeightAnchor = heightAnchor.constraint(equalToConstant: .zero)

        NSLayoutConstraint.activate([
            viewWidthAnchor,
            viewHeightAnchor,
            imageWidthAnchor,
            imageHeightAnchor,
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }

    func updateConfiguration() {
        imageView.configuration = configuration.imageViewConfiguration
        imageWidthAnchor.constant = configuration.imageSize
        imageHeightAnchor.constant = configuration.imageSize
        let viewSize = configuration.imageSize + configuration.ringWidth * .countStroke
        viewWidthAnchor.constant = viewSize
        viewHeightAnchor.constant = viewSize
        setNeedsDisplay()
    }
}

// MARK: - Constants

private extension CGFloat {

    static let countStroke: CGFloat = 4
}
