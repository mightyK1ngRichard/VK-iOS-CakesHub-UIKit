//
//  MainBannerCell.swift
//  UIKit+SwiftUI
//
//  Created by Dmitriy Permyakov on 29.01.2024.
//

import SwiftUI
import UIKit
import CHMUIKIT

final class MainBannerCell: UICollectionViewCell {

    static let identifier = String(describing: "\(MainBannerCell.self)")

    private var model = CHMBigBannerView.ObservedConfiguration()
    private lazy var bannerSwiftUIView = CHMBigBannerView(model: model)
    private var bannerView: UIView! = nil

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }

    #if DEBUG
    fileprivate init(configuration: CHMBigBannerView.Configuration) {
        super.init(frame: .zero)
        setup()
        model.configuration = configuration
    }
    #endif

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainBannerCell {

    func configurate(configuration: CHMBigBannerView.Configuration) {
        model.configuration = configuration
    }
}

private extension MainBannerCell {

    func setup() {
        let hostingViewController = UIHostingController(rootView: bannerSwiftUIView)
        guard let uiView = hostingViewController.view else {
            fatalError("BannerSwiftUIView is nil")
        }
        bannerView = uiView
        bannerView.backgroundColor = .clear
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bannerView)
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: topAnchor),
            bannerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bannerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - Preview

#Preview {
    SwiftUIPreview {
        MainBannerCell(configuration: .basic(
            imageKind: .image(Image("Big Banner")),
            bannerTitle: "Fashion\nsale",
            buttonTitle: "Check"
        ))
    }
    .frame(width: 376, height: 536)
}
