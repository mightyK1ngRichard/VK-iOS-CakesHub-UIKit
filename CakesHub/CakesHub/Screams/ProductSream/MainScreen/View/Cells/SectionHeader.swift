//
//  SectionHeader.swift
//  UIKit+SwiftUI
//
//  Created by Dmitriy Permyakov on 29.01.2024.
//

import SwiftUI
import UIKit

final class SectionHeader: UICollectionReusableView {

    static let kind = String(describing: "kind: \(SectionHeader.self)")
    static let identifier = String(describing: "\(SectionHeader.self)")

    // MARK: Configuration

    struct Configuration {
        var title: String = .clear
        var subtitle: String = .clear
        var moreTitleButton: String = .clear

        static let clear = Configuration()
        static func basic(title: String, subtitle: String, moreTitleButton: String) -> Self {
            .init(title: title, subtitle: subtitle, moreTitleButton: moreTitleButton)
        }
    }

    struct HandlerConfiguration {
        var didTapMoreTitleButton: CHMVoidBlock?
        static let clear = HandlerConfiguration()
    }

    var configuration: Configuration {
        didSet {
            updateConfiguration()
        }
    }
    var handlerConfiguration: HandlerConfiguration

    // MARK: UI Components

    private lazy var titleView = UILabel().with {
        $0.text = configuration.title
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 34, weight: .bold)
        $0.textColor = .textPrimary
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var subtitleView = UILabel().with {
        $0.text = configuration.subtitle
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 11, weight: .regular)
        $0.textColor = UIColor(hexLight: 0x9B9B9B, hexDark: 0xABB4BD)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var readMoreTitle = UIButton(type: .system).with {
        $0.setTitle(configuration.moreTitleButton, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 11, weight: .regular)
        $0.setTitleColor(.textPrimary, for: .normal)
        $0.addTarget(self, action: #selector(didTapMoreTitle), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: Lifecycle

    override init(frame: CGRect) {
        self.configuration = .clear
        self.handlerConfiguration = .clear
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configurate(
        configuration: Configuration = .clear,
        handlerConfiguration: HandlerConfiguration = .clear
    ) {
        self.configuration = configuration
        self.handlerConfiguration = handlerConfiguration
    }
}

// MARK: - Setup

private extension SectionHeader {

    func setup() {
        backgroundColor = .clear
        [titleView, subtitleView, readMoreTitle].forEach { addSubview($0) }

        readMoreTitle.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: topAnchor),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: readMoreTitle.leadingAnchor),

            subtitleView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 4),
            subtitleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            subtitleView.trailingAnchor.constraint(equalTo: readMoreTitle.leadingAnchor),
            subtitleView.bottomAnchor.constraint(equalTo: bottomAnchor),

            readMoreTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            readMoreTitle.firstBaselineAnchor.constraint(equalTo: titleView.firstBaselineAnchor)
        ])
    }

    func updateConfiguration() {
        titleView.text = configuration.title
        subtitleView.text = configuration.subtitle
        readMoreTitle.setTitle(configuration.moreTitleButton, for: .normal)
    }

    // MARK: Actions

    @objc
    func didTapMoreTitle() {
        handlerConfiguration.didTapMoreTitleButton?()
    }
}

// MARK: - Preview

#Preview {
    SwiftUIPreview {
        let view = SectionHeader()
        view.configuration = .basic(
            title: "Sales",
            subtitle: "Super summer sale",
            moreTitleButton: "Смотреть всё"
        )
        view.handlerConfiguration.didTapMoreTitleButton = {
            print("DidTapButton")
        }
        return view
    }
    .fittingSize(width: UIScreen.main.bounds.width - 32)
}
