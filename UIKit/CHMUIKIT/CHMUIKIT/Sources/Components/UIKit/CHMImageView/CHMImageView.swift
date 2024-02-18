//
//  CHMImageView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 10/10/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

/**
 Component `CHMImageView`

 For example:
 ```swift
 let view = CHMImageView(
     configuration: .basic(
         .url(.mockLoadingUrl, placeholder: .cake),
         imageKind: .static(20)
     )
 )
 ```
 */
public final class CHMImageView: UIView, Configurable {

    // MARK: Public Properties

    /// Configuration of the view
    public var configuration: Configuration {
        didSet {
            updateConfiguration()
        }
    }

    // MARK: Private UI Properties

    private lazy var backgroundView = CHMBackgroundView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var imageView = UIImageView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    private lazy var placeholderView = UIImageView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
    }

    // MARK: Computed values

    /// View corner radius
    private var viewCornerRadius: CGFloat {
        switch configuration.imageKind {
        case .capsule:
            return min(imageView.bounds.height, imageView.bounds.width) / .divider
        case .static(let corner):
            return corner
        case .square:
            return .zero
        }
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

    public override func layoutSubviews() {
        super.layoutSubviews()
        let corner = viewCornerRadius
        backgroundView.configuration = modify(backgroundView.configuration) {
            $0.bgCornerRadius = corner
        }
        backgroundView.layer.cornerRadius = corner
        imageView.layer.cornerRadius = corner
        layer.cornerRadius = corner
    }
}

// MARK: - Private Methods

private extension CHMImageView {

    func setup() {
        backgroundColor = .clear
        addSubviews(backgroundView, imageView, placeholderView)
        addConstraints()
        updateConfiguration()
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),

            placeholderView.centerXAnchor.constraint(equalTo: centerXAnchor),
            placeholderView.centerYAnchor.constraint(equalTo: centerYAnchor),
            placeholderView.widthAnchor.constraint(equalToConstant: .placeholderWidth),
            placeholderView.heightAnchor.constraint(equalToConstant: .placeholderHeight)
        ])
    }

    func updateConfiguration() {
        backgroundView.configuration = configuration.backgroundConfiguration
        placeholderView.tintColor = configuration.imageConfiguration.placeholderColor
        placeholderView.image = ImageConfiguration.Placeholder.clear.image
        configuration.imageConfiguration.kind.setImage { [weak self] image in
            guard let self else { return }
            imageView.image = image
            let imageNotNil = !imageView.image.isNil
            placeholderView.isHidden = imageNotNil
            placeholderView.image = configuration.imageConfiguration.kind.placeholderImage
            backgroundView.isHidden = imageNotNil
        }
    }
}

// MARK: - Constants

private extension CGFloat {

    static let divider: CGFloat = 2
    static let placeholderHeight: CGFloat = 30
    static let placeholderWidth: CGFloat = 30
}

import SwiftUI
struct CHMImageViewPreview2: PreviewProvider {

    static var previews: some View {
        Group {
            DefaultView
            ShapesView
            EmptyView
            PhotoView
        }
    }
}
private extension CHMImageViewPreview2 {

    /// Default view
    static var DefaultView: some View {
        SwiftUIPreview {
            CHMImageView(
                configuration: .basic(
                    .url(.mockLoadingUrl, placeholder: .cake)
                )
            )
        }
        .previewDisplayName("Default")
        .frame(width: 300, height: 300)
    }

    /// View using shapes
    static var ShapesView: some View {
        VStack {
            SwiftUIPreview {
                CHMImageView(
                    configuration: .basic(
                        .url(.mockLoadingUrl),
                        imageKind: .capsule
                    )
                )
            }
            .frame(width: 150, height: 150)

            SwiftUIPreview {
                CHMImageView(
                    configuration: .basic(
                        .url(.mockLoadingUrl),
                        imageKind: .capsule
                    )
                )
            }
            .frame(width: 200, height: 130)

            SwiftUIPreview {
                CHMImageView(
                    configuration: .basic(
                        .url(.mockLoadingUrl),
                        imageKind: .static(20)
                    )
                )
            }
            .frame(width: 150, height: 150)

            SwiftUIPreview {
                CHMImageView(
                    configuration: .basic(
                        .url(.mockLoadingUrl)
                    )
                )
            }
            .frame(width: 150, height: 150)
        }
        .previewDisplayName("Shapes")
    }

    /// View with placeholders
    static var EmptyView: some View {
        VStack {
            SwiftUIPreview {
                CHMImageView(
                    configuration: .basic(
                        .url(nil)
                    )
                )
            }
            .frame(width: 100, height: 100)

            SwiftUIPreview {
                CHMImageView(
                    configuration: .basic(
                        .url(nil, placeholder: .folder)
                    )
                )
            }
            .frame(width: 100, height: 100)

            SwiftUIPreview {
                CHMImageView(
                    configuration: .basic(
                        .url(nil, placeholder: .clear)
                    )
                )
            }
            .frame(width: 100, height: 100)

            SwiftUIPreview {
                CHMImageView(
                    configuration: .basic(
                        .url(
                            nil,
                            placeholder: .image(
                                UIImage(systemName: "person.circle.fill")
                            )
                        )
                    )
                )
            }
            .frame(width: 100, height: 100)
        }
        .previewDisplayName("Empty image")
    }

    /// View from bundleNamed
    static var PhotoView: some View {
        SwiftUIPreview {
            CHMImageView(
                configuration: .basic(.image(UIImage(bundleNamed: "cake"), placeholder: .cake))
            )
        }
        .previewDisplayName("Photo")
        .frame(width: 300, height: 300)
    }
}
