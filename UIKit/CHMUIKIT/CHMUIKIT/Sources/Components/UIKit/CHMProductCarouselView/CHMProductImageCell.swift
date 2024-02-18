//
//  CHMProductImageCell.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 05/11/2023.
//

import UIKit

final class CHMProductImageCell: UICollectionViewCell {
    
    static let identifier = String(describing: "\(CHMProductImageCell.self)")

    private let imageView = CHMImageView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public func

extension CHMProductImageCell {

    func configuration(_ configuration: CHMImageView.Configuration) {
        imageView.configuration = configuration
    }
}

// MARK: - Private func

private extension CHMProductImageCell {

    func setup() {
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
