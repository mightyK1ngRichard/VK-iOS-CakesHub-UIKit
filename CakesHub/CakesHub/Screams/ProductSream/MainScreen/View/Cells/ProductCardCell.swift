//
//  ProductCardCell.swift
//  UIKit+SwiftUI
//
//  Created by Dmitriy Permyakov on 31.01.2024.
//

import UIKit
import CHMUIKIT

final class ProductCardCell: UICollectionViewCell {

    static let identifier = String(describing: "\(ProductCardCell.self)")

    private lazy var productCard = CHMMainProductCard().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        productCard.configuration = .clear
    }
}

// MARK: - Configuration

extension ProductCardCell {

    func configurate(configuration: CHMMainProductCard.Configuration) {
        productCard.configuration = configuration
    }

    func pressedBasket(didTapButton: CHMBoolBlock?) {
        productCard.didTapButton = didTapButton
    }
}

// MARK: - Setup

private extension ProductCardCell {

    func setup() {
        addSubview(productCard)
        NSLayoutConstraint.activate([
            productCard.leadingAnchor.constraint(equalTo: leadingAnchor),
            productCard.trailingAnchor.constraint(equalTo: trailingAnchor),
            productCard.topAnchor.constraint(equalTo: topAnchor),
            productCard.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

// MARK: - Preview

#Preview {
    let cell = ProductCardCell()
    cell.configurate(
        configuration: .mockData
    )
    cell.translatesAutoresizingMaskIntoConstraints = false
    cell.widthAnchor.constraint(equalToConstant: 300).isActive = true
    cell.heightAnchor.constraint(equalToConstant: 500).isActive = true
    return cell
}

// MARK: - Mock Data

private extension CHMMainProductCard.Configuration {

    static let mockData = CHMMainProductCard.Configuration.basic(
        imageSource: .url(.mockProductCard, placeholder: .cake),
        productName: "Evening Dress",
        sellerName: "Dorothy Perkins",
        price: "14$",
        badgeConfiguration: .basic(kind: .red, text: "-10%"),
        productButtonKind: .favorite(isSelected: true),
        reviewStarsConfiguration: .basic(countStars: 5, countFillStars: 2)
    )
}
