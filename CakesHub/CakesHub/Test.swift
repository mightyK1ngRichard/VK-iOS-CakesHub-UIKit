//
//  Test.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 31.01.2024.
//

import UIKit
import CHMUIKIT

final class Test: UIViewController {

    private lazy var stars = CHMReviewStars().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .red
        $0.configuration = .clear
    }
    private lazy var button = UIButton(type: .system).with {
        $0.setTitle("TAP ME", for: .normal)
        $0.frame.size = .init(width: 200, height: 50)
        $0.frame.origin = .init(x: 50, y: 400)
        $0.addTarget(self, action: #selector(didTap), for: .touchUpInside)
    }
    private var number: Int = 0
    private lazy var label = UILabel().with {
        $0.text = "\(number)"
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var image = CHMImageView(
        configuration: .basic(.url(.mockCake1, placeholder: .cake))
    ).with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(stars, button, image, label)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            image.heightAnchor.constraint(equalToConstant: 200),

            stars.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 100),
            stars.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),

            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }

    @objc
    func didTap() {
        number = (0...5).randomElement()!
        label.text = "\(number)"
        stars.configuration = .basic(countStars: number, countFillStars: 3, countReviews: 100)
    }
}

// MARK: - Preview

import SwiftUI

#Preview {
    Test()
}
