//
//  CHMProductCard.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 05/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

/**
 Component `CHMProductCard`

 For example:
 ```swift
  let product = CHMProductCard(
      configuration: .basic(
          price: "11000 $",
          seller: "Juster for Babies",
          description: "Самый крутой торт всея всех тортов",
          images: .url([
              .mockLoadingUrl,
              .mockCake1,
              .mockCake2,
              .mockCake3,
              .mockCake4,
              .invalidUrl,
          ])
      )
  )
 ```
*/
public final class CHMProductCard: UIView, Configurable {

    // MARK: Public Properties

    /// Configuration of the view
    public var configuration: Configuration {
        didSet {
            updateConfiguration()
        }
    }

    /// Handler configuration of the view
    public var handlerConfiguration: HandlerConfiguration {
        didSet {
            updateHanlers()
            updateInteraction()
        }
    }

    // MARK: Private UI Properties

    private lazy var productCarousel = CHMProductCarouselView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var basket = UIImageView().with {
        $0.image = UIImage(systemName: "cart")!
        let gesture = UITapGestureRecognizer(target: self, action: #selector(presedBasket))
        $0.addGestureRecognizer(gesture)
        $0.tintColor = .blackWhite
        $0.isUserInteractionEnabled = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
    }
    private lazy var priceLabel = CHMLabel().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var sellerLabel = CHMLabel().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var descriptionLabel = CHMLabel().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
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

private extension CHMProductCard {

    func setup() {
        backgroundColor = .clear
        addSubviews(productCarousel, priceLabel, basket, sellerLabel, descriptionLabel)
        addConstraints()
        updateConfiguration()
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            productCarousel.topAnchor.constraint(equalTo: topAnchor),
            productCarousel.leadingAnchor.constraint(equalTo: leadingAnchor),
            productCarousel.trailingAnchor.constraint(equalTo: trailingAnchor),

            priceLabel.topAnchor.constraint(equalTo: productCarousel.bottomAnchor, constant: .topPadding),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .labelHPadding),
            priceLabel.trailingAnchor.constraint(equalTo: basket.leadingAnchor, constant: -.labelHPadding),

            basket.topAnchor.constraint(equalTo: priceLabel.topAnchor),
            basket.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.labelHPadding),
            basket.widthAnchor.constraint(equalToConstant: .basketSize),
            basket.heightAnchor.constraint(equalToConstant: .basketSize),

            sellerLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: .innerTopPadding),
            sellerLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            sellerLabel.trailingAnchor.constraint(equalTo: basket.trailingAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: sellerLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: basket.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -44),
        ])
    }

    func updateConfiguration() {
        priceLabel.configuration = configuration.priceConfiguration
        sellerLabel.configuration = configuration.sellerConfiguration
        descriptionLabel.configuration = configuration.descriptionConfiguration
        productCarousel.configuration = configuration.productCarouselConfiguration
    }

    func updateInteraction() {
        productCarousel.isUserInteractionEnabled = !handlerConfiguration.actionImageTapHandler.isNil
    }

    func updateHanlers() {
        productCarousel.handlerConfiguration.actionImageTapHandler = handlerConfiguration.actionImageTapHandler

    }

    // MARK: Action

    @objc
    func presedBasket() {
        handlerConfiguration.actionBasketTapHandler?()
    }
}

// MARK: - Constants

private extension CGFloat {

    static let basketSize: CGFloat = 24
    static let labelHPadding: CGFloat = 8
    /// Padding between collection view and price
    static let topPadding: CGFloat = 12
    /// Padding between seller and price
    static let innerTopPadding: CGFloat = 4
}
