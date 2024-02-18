//
//  CHMProductUIButton.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 01.02.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import UIKit

/**
 Component `CHMProductUIButton`

 For example:
 ```swift
 let view = CHMProductUIButton(
     configuration: .basic(kind: .favorite(isSelected: true))
 )
 ```
*/
public final class CHMProductUIButton: UIControl {

    // MARK: Public Properties

    /// Configuration of the view
    public var configuration: Configuration {
        didSet {
            updateConfiguration()
        }
    }
    public var didTapButton: CHMBoolBlock?
    public override var isHighlighted: Bool {
        didSet {
            backgroundView.layer.shadowColor = isHighlighted
            ? UIColor.systemMint.cgColor
            : configuration.shadowColor.cgColor

            backgroundView.layer.shadowOpacity = isHighlighted ? 1 : .shadowOpacity
        }
    }

    // MARK: Private UI Properties

    private lazy var iconView = CHMIcon().with {
        $0.isUserInteractionEnabled = false
        $0.widthAnchor.constraint(equalToConstant: 13).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 13).isActive = true
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var backgroundView = UIView().with {
        $0.isUserInteractionEnabled = false
        $0.widthAnchor.constraint(equalToConstant: .backgroundSize).isActive = true
        $0.heightAnchor.constraint(equalToConstant: .backgroundSize).isActive = true
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

private extension CHMProductUIButton {

    func setup() {
        backgroundColor = .clear
        addTarget(self, action: #selector(didTapButtonFunc), for: .touchUpInside)
        addSubviews(backgroundView, iconView)
        addConstraints()
        updateConfiguration()
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),

            iconView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
        ])
    }

    func updateConfiguration() {
        isSelected = configuration.isSelected
        iconView.configuration = configuration.iconViewConfiguration
        backgroundView.backgroundColor = configuration.backgroundColor
        backgroundView.layer.cornerRadius = .backgroundSize.half
        backgroundView.layer.shadowColor = configuration.shadowColor.cgColor
        backgroundView.layer.shadowOffset = .shadowOffset
        backgroundView.layer.shadowRadius = .shadowRadius
        backgroundView.layer.shadowOpacity = .shadowOpacity
    }

    // MARK: Actions

    @objc
    func didTapButtonFunc() {
        isSelected.toggle()
        didTapButton?(isSelected)
    }
}

// MARK: - Preview

import SwiftUI

#Preview {
    VStack(spacing: 30) {
        SwiftUIPreview {
            CHMProductUIButton(
                configuration: .basic(kind: .favorite(isSelected: true))
            ).with {
                $0.didTapButton = { isSelected in
                    print("isSelected: \(isSelected)")
                }
            }
        }
        .fittingSize()

        SwiftUIPreview {
            CHMProductUIButton(configuration: .basic(kind: .favorite(isSelected: false))) { isSelected in
                print("isSelected: \(isSelected)")
            }
        }
        .fittingSize()

        SwiftUIPreview {
            CHMProductUIButton(configuration: .basic(kind: .basket))
        }
        .fittingSize()
    }
}

// MARK: - Constants

private extension CGSize {

    static let shadowOffset = CGSize(width: 0, height: 4)
}

private extension Float {

    static let shadowOpacity: Float = 0.16
}

private extension CGFloat {

    static let backgroundSize: CGFloat = 36
    static let cornerRadius: CGFloat = 18
    static let shadowRadius: CGFloat = 2
}
