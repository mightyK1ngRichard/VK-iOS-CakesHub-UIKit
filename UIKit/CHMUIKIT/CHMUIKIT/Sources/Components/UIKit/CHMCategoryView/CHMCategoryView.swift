//
//  CHMCategoryView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 06/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

/**
 Component `CHMCategoryView`

 For example:
 ```swift
 let catigoryView = CHMCategoryView(
     configuration: .basic(
         .url,
         title: "Свадебные"
     )
 )
 ```
*/
public final class CHMCategoryView: UIView, Configurable {

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
    private lazy var titleView = CHMLabel().with {
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

private extension CHMCategoryView {

    func setup() {
        backgroundColor = .clear
        addSubviews(imageView, titleView)
        addConstraints()
        updateConfiguration()
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            titleView.topAnchor.constraint(equalTo: topAnchor, constant: .padding),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .padding),
            titleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.padding),
        ])
    }

    func updateConfiguration() {
        imageView.configuration = configuration.imageViewConfiguration
        titleView.configuration = configuration.titleConfiguration
    }
}

// MARK: - Constants

private extension CGFloat {

    static let padding: CGFloat = 8
}
