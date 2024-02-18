//
//  CHMMainProductCard.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 31.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import UIKit

/**
 Component `CHMLabel`

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
public final class CHMMainProductCard: UIView {

    // MARK: Public Properties
    
    /// Configuration of the view
    public var configuration: Configuration {
        didSet {
            updateConfiguration()
        }
    }
    public var didTapButton: CHMBoolBlock? = nil {
        didSet {
            updateHandler()
        }
    }

    // MARK: Private UI Properties

    private lazy var imageView = CHMImageView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var badgeView = CHMCardBadge().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var reviewStarsView = CHMReviewStars().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var productButton = CHMProductUIButton().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var sellerLabel = UILabel().with {
        $0.font = .systemFont(ofSize: 11, weight: .regular)
        $0.textColor = .textSecondary
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var productLabel = UILabel().with {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = .textPrimary
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var priceLabel = UILabel().with {
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.textColor = .textPrimary
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: Lifecycle

    public init(
        configuration: Configuration = .clear,
        didTapButton: CHMBoolBlock? = nil
    ) {
        self.configuration = configuration
        self.didTapButton = didTapButton
        super.init(frame: .zero)
        productButton.didTapButton = didTapButton
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

private extension CHMMainProductCard {

    func setup() {
        backgroundColor = .clear
        addSubviews(
            imageView,
            badgeView,
            reviewStarsView,
            sellerLabel,
            productLabel,
            priceLabel,
            productButton
        )
        addConstraints()
        updateConfiguration()
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),

            badgeView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 8),
            badgeView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 9),

            reviewStarsView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 7),
            reviewStarsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),

            sellerLabel.topAnchor.constraint(equalTo: reviewStarsView.bottomAnchor, constant: 6),
            sellerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            sellerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            productLabel.topAnchor.constraint(equalTo: sellerLabel.bottomAnchor, constant: 5),
            productLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            productLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            priceLabel.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),

            productButton.centerYAnchor.constraint(equalTo: imageView.bottomAnchor),
            productButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    func updateConfiguration() {
        imageView.configuration = configuration.imageViewConfiguration
        badgeView.configuration = configuration.badgeConfiguration
        reviewStarsView.configuration = configuration.reviewStarsViewConfiguration
        sellerLabel.text = configuration.sellerName
        productLabel.text = configuration.productName
        priceLabel.text = configuration.price
        productButton.configuration = configuration.productButtonConfiguration
    }

    func updateHandler() {
        productButton.didTapButton = didTapButton
    }
}

// MARK: - Preview

import SwiftUI

#Preview {
    SwiftUIPreview {
        CHMMainProductCard(configuration: .basic(
            imageSource: .url(.mockProductCard, placeholder: .cake),
            productName: "Evening Dress",
            sellerName: "Dorothy Perkins",
            price: "14$",
            badgeConfiguration: .basic(kind: .red, text: "-10%"),
            productButtonKind: .favorite(isSelected: true),
            reviewStarsConfiguration: .basic(countStars: 5, countFillStars: 4, countReviews: 100)
        ))
    }
    .frame(width: 150, height: 260)
}
