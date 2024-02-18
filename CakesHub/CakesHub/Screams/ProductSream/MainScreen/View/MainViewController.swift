//
//  MainViewController.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 05.02.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI
import UIKit
import CHMUIKIT

final class MainViewController: UIViewController, ViewModelable {

    // MARK: Coordinator

    weak var coordinator: MainViewControllerCoordinator?

    // MARK: View Model

    typealias ViewModel = MainViewModel
    var viewModel: ViewModel

    // MARK: Private UI Properties

    private lazy var progresseView = UIActivityIndicatorView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private var isActive = false
    private lazy var screenSize = view.frame.height
    private lazy var collectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.dataSource = self
        cv.delegate = self
        cv.register(
            SectionHeader.self,
            forSupplementaryViewOfKind: SectionHeader.kind,
            withReuseIdentifier: SectionHeader.identifier
        )
        cv.register(MainBannerCell.self, forCellWithReuseIdentifier: MainBannerCell.identifier)
        cv.register(ProductCardCell.self, forCellWithReuseIdentifier: ProductCardCell.identifier)
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.contentInsetAdjustmentBehavior = .never
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    private let model = CHMBigBannerView.ObservedConfiguration()
    private lazy var bannerSwiftUIView = CHMBigBannerView(model: model)
    private lazy var bannerView = UIView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var fakeView = UIView().with {
        $0.layer.cornerRadius = 26
        $0.backgroundColor = .bgMainColor
    }

    // MARK: Lifecycle

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.startViewDidLoad()
        setup()
        fetchData()
    }
}

// MARK: - Network

private extension MainViewController {

    func fetchData() {
        viewModel.fetchData() { [weak self] in
            guard let self else { return }
            collectionView.reloadData()
        }
    }
}

// MARK: - Setup

private extension MainViewController {

    func setup() {
        view.backgroundColor = .clear
        setupBannerView()
        setupFakeView()
        setupCollectionView()
        setupProgressView()
    }

    func setupProgressView() {
        view.addSubview(progresseView)
        progresseView.style = .medium
        NSLayoutConstraint.activate([
            progresseView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            progresseView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    func setupFakeView() {
        fakeView.frame = view.bounds
        fakeView.frame.origin.y = .bannerHeight
        view.addSubview(fakeView)
    }

    func setupBannerView() {
        model.configuration = .mockData
        let hostingViewController = UIHostingController(rootView: bannerSwiftUIView)
        guard let uiView = hostingViewController.view else { return }
        addChild(hostingViewController)
        bannerView = uiView
        uiView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: .bannerHeight)
        view.addSubview(uiView)
        hostingViewController.didMove(toParent: self)
    }

    func setupCollectionView() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewCompositionalLayout

private extension MainViewController {

    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self else { return nil }
            switch viewModel.sections[sectionIndex] {
            case .banner:
                return createBannerSectionLayout
            case .news:
                return createNewProductsSectionLayout
            case .sales:
                return createSalesProductsSectionLayout
            case .all:
                return createAllProductsSectionLayout
            }
        }
        return layout
    }

    var createBannerSectionLayout: NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(.bannerHeight)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.bottom = 13
        return section
    }

    var createSalesProductsSectionLayout: NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.43),
            heightDimension: .fractionalHeight(290/812)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 17

        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(40)
        )
        section.boundarySupplementaryItems = [
            .init(layoutSize: headerSize, elementKind: SectionHeader.kind, alignment: .topLeading)
        ]
        section.contentInsets = .init(top: 22, leading: 8, bottom: 40, trailing: 8)

        return section
    }

    var createNewProductsSectionLayout: NSCollectionLayoutSection {
        createSalesProductsSectionLayout
    }

    var createAllProductsSectionLayout: NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 0, bottom: 5, trailing: 0)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(320/812)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 2
        )
        group.interItemSpacing = .fixed(8)

        let section = NSCollectionLayoutSection(group: group)

        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(40)
        )
        section.boundarySupplementaryItems = [
            .init(layoutSize: headerSize, elementKind: SectionHeader.kind, alignment: .topLeading)
        ]
        section.interGroupSpacing = 26
        section.contentInsets = .init(top: 22, leading: 8, bottom: 40, trailing: 8)
        return section
    }
}

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.sections[section].itemsCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch viewModel.sections[indexPath.section] {
        case let .banner(bannerConfiguration):
            return generateBannerCell(collectionView, configuration: bannerConfiguration, indexPath: indexPath)
        case let .news(products):
            return generateNewsProductCardCell(collectionView, configuration: products[indexPath.item], indexPath: indexPath)
        case let .sales(products):
            return generateNewsProductCardCell(collectionView, configuration: products[indexPath.item], indexPath: indexPath)
        case let .all(products):
            return generateNewsProductCardCell(collectionView, configuration: products[indexPath.item], indexPath: indexPath)
        }
    }

    func generateBannerCell(_ collectionView: UICollectionView, configuration: CHMBigBannerView.Configuration, indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let bannerCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MainBannerCell.identifier,
                for: indexPath
            ) as? MainBannerCell
        else {
            let errorMessage = "Ошибко приведения ячейки к типу MainBannerCell"
            fatalError(errorMessage)
        }
        bannerCell.configurate(configuration: configuration)
        return bannerCell
    }

    func generateNewsProductCardCell(_ collectionView: UICollectionView, configuration: CHMMainProductCard.Configuration, indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let productCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProductCardCell.identifier,
                for: indexPath
            ) as? ProductCardCell
        else {
            let errorMessage = "Ошибко приведения ячейки к типу MainBannerCell"
            fatalError(errorMessage)
        }
        productCell.configurate(configuration: configuration)
        return productCell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard
            let supplementaryView = collectionView.dequeueReusableSupplementaryView(
                ofKind: SectionHeader.kind,
                withReuseIdentifier: SectionHeader.identifier,
                for: indexPath
            ) as? SectionHeader
        else {
            let errorMessage = "Reusable view must be SectionHeader"
            fatalError(errorMessage)
        }

        switch viewModel.sections[indexPath.section] {
        case .banner: break
        case .news:
            supplementaryView.configurate(
                configuration: .headerOfNewSectionConfiguration
            )
            supplementaryView.handlerConfiguration.didTapMoreTitleButton = {
                print("Did tap new")
            }
        case .sales:
            supplementaryView.configurate(
                configuration: .headerOfSalesSectionConfiguration
            )
            supplementaryView.handlerConfiguration.didTapMoreTitleButton = {
                print("Did tap sales")
            }
        case .all:
            supplementaryView.configurate(
                configuration: .headerOfAllSectionConfiguration
            )
            supplementaryView.handlerConfiguration.didTapMoreTitleButton = {
                print("Did tap sales")
            }
        }
        return supplementaryView
    }
}

extension MainViewController: UICollectionViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.bounds.origin.y
        let offset = currentOffset >= .bannerHeight ? .zero : .bannerHeight - currentOffset
        fakeView.frame.origin.y = offset
        if currentOffset >= 0 {
            if isActive {
                progresseView.stopAnimating()
                isActive = false
            }
        }
        if currentOffset < 0 {
            if !isActive {
                viewModel.pullToRefresh()
            }
            progresseView.startAnimating()
            isActive = true
            let scale = 1 - currentOffset * 2.3 / .bannerHeight
            bannerView.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    }
}

// MARK: - Constants

private extension SectionHeader.Configuration {

    static var headerOfSalesSectionConfiguration: Self {
        .basic(title: "Sales", subtitle: "Super summer sale", moreTitleButton: .lookMore)
    }

    static var headerOfNewSectionConfiguration: Self {
        .basic(title: "New", subtitle: "You’ve never seen it before!", moreTitleButton: .lookMore)
    }

    static var headerOfAllSectionConfiguration: Self {
        .basic(title: "All", subtitle: "All products", moreTitleButton: .lookMore)
    }
}

private extension String {

    static let lookMore = "Смотреть всё"
}

private extension CGFloat {

    static let bannerHeight: CGFloat = 550
}

// MARK: - Preview

#Preview {
    MainViewController(viewModel: .mockData)
}
