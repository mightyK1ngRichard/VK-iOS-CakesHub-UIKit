//
//  CHMProductCarouselView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 06/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

/**
 Component `CHMProductCarouselView`

 For example:
 ```swift
  let carousel = CHMProductCarouselView(
      configuration: .basic(
          .url([
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
public final class CHMProductCarouselView: UIView, Configurable {

    // MARK: Public Properties

    /// Configuration of the view
    public var configuration: Configuration {
        didSet {
            updateConfiguration()
        }
    }

    /// Handler configuration of the view
    public var handlerConfiguration: HandlerConfiguration

    // MARK: Computed values

    private var colWidth: CGFloat {
        collectionView.bounds.width
    }

    private var showedImages: [(IndexPath, UIImage?)] = []

    // MARK: Private UI Properties

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: UICollectionViewCell.defaultIdentifier
        )
        collectionView.register(
            CHMProductImageCell.self,
            forCellWithReuseIdentifier: CHMProductImageCell.identifier
        )
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.layer.cornerRadius = .cornerRadius
        collectionView.layer.borderWidth = .borderWidth
        collectionView.layer.borderColor = UIColor.white.cgColor
        return collectionView
    }()
    private lazy var pageControl = UIPageControl().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.currentPageIndicatorTintColor = .wild
        $0.backgroundStyle = .minimal
        $0.allowsContinuousInteraction = false
        $0.addTarget(self, action: #selector(pressedPageControll(sender:)), for: .valueChanged)
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

private extension CHMProductCarouselView {

    func setup() {
        backgroundColor = .clear
        addSubviews(collectionView, pageControl)
        addConstraints()
        updateConfiguration()
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),

            pageControl.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -.pageControlPadding),
        ])
    }

    func updateConfiguration() {
        collectionView.reloadData()
        pageControl.numberOfPages = configuration.kind.count
    }
}

// MARK: - UICollectionViewDataSource

extension CHMProductCarouselView: UICollectionViewDataSource {

    public func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        configuration.kind.count
    }

    public func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CHMProductImageCell.identifier,
                for: indexPath
            ) as? CHMProductImageCell
        else {
            return collectionView.defaultCell(indexPath)
        }
        switch configuration.kind {
        case .image(let images):
            cell.configuration(
                .basic(
                    .image(
                        images[indexPath.item],
                        placeholder: .cake
                    )
                )
            )
        case .url(let urls):
            cell.configuration(
                .basic(
                    .url(
                        urls[indexPath.item],
                        placeholder: .cake
                    )
                )
            )
        }
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CHMProductCarouselView: UICollectionViewDelegate {

    public func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        handlerConfiguration.actionImageTapHandler?(indexPath.item)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CHMProductCarouselView: UICollectionViewDelegateFlowLayout {

    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(
            width: colWidth,
            height: collectionView.bounds.height
        )
    }

    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        .minimumLineSpacingForSectionAt
    }
}

// MARK: - UIScrollViewDelegate

extension CHMProductCarouselView: UIScrollViewDelegate {

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / colWidth)
    }
}

// MARK: - Actions

private extension CHMProductCarouselView {

    @objc 
    func pressedPageControll(sender: UIPageControl) {
        let offsetX = CGFloat(pageControl.currentPage) * colWidth
        collectionView.setContentOffset(CGPoint(x: offsetX, y: .zero), animated: true)
    }
}

// MARK: - Constants

private extension CGFloat {

    static let pageControlPadding: CGFloat = 8
    static let borderWidth: CGFloat = 1
    static let cornerRadius: CGFloat = 8
    static let minimumLineSpacingForSectionAt: CGFloat = .zero
}
