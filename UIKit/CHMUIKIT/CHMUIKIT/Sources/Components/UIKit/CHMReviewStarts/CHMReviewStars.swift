//
//  CHMReviewStars.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 31.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import UIKit

/**
 Component `CHMReviewStarts`

 For example:
 ```swift
 let view = CHMReviewStarts(
     configuration: .basic(countStars: 5, countFillStars: 3)
 )
 ```
*/
public final class CHMReviewStars: UIView {

    // MARK: Public Properties
    
    /// Configuration of the view
    public var configuration: Configuration {
        didSet {
            updateConfiguration()
        }
    }

    // MARK: Private UI Properties

    private lazy var countReviewsView = CHMLabel().with {
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

private extension CHMReviewStars {

    func setup() {
        backgroundColor = .clear
        updateConfiguration()
    }

    func updateConfiguration() {
        countReviewsView.configuration = configuration.countReviewsConfiguration
        // FIXME: Сейчас делать лень, по хорошему сделать переопределние компнентов
        for view in subviews { view.removeFromSuperview() }
        addSubview(countReviewsView)
        var lastStarView: UIImageView? = nil
        (0..<configuration.startsCount).forEach { index in
            let starView = generateStar(index)
            addSubview(starView)
            let leftPadding: CGFloat = index == 0 ? .zero : configuration.starsPadding
            NSLayoutConstraint.activate([
                starView.leadingAnchor.constraint(
                    equalTo: lastStarView?.trailingAnchor ?? leadingAnchor,
                    constant: leftPadding
                ),
                starView.topAnchor.constraint(equalTo: topAnchor),
                starView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
            lastStarView = starView
        }
        guard let lastStarView else { return }
        if configuration.countReviews != nil {
            NSLayoutConstraint.activate([
                countReviewsView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
                countReviewsView.leadingAnchor.constraint(equalTo: lastStarView.trailingAnchor, constant: 3),
                countReviewsView.trailingAnchor.constraint(equalTo: trailingAnchor),
                countReviewsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
            ])
        } else {
            lastStarView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        }
    }

    func generateStar(_ index: Int) -> UIImageView {
        let starView = UIImageView()
        starView.translatesAutoresizingMaskIntoConstraints = false
        starView.image = index >= configuration.countFillStars ? .starOutline : .starFill
        starView.widthAnchor.constraint(equalToConstant: configuration.starSize).isActive = true
        starView.heightAnchor.constraint(equalToConstant: configuration.starSize).isActive = true
        starView.contentMode = .scaleAspectFit
        return starView
    }
}
