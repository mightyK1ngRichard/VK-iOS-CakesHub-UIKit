//
//  CHMUIShimmeringView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 02.02.2024.
//

import UIKit

final class CHMUIShimmeringView: UIView {
    let shimmeringView = UIView()
    let gradientLayer = CAGradientLayer()
    var shimmerCornerRadius: CGFloat = .zero

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = shimmeringView.bounds
        gradientLayer.cornerRadius = shimmerCornerRadius
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        shimmeringView.translatesAutoresizingMaskIntoConstraints = false

        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        shimmeringView.layer.addSublayer(gradientLayer)

        let titleGroup = makeAnimationGroup()
        titleGroup.beginTime = 0.0
        gradientLayer.add(titleGroup, forKey: "backgroundColor")
    }

    func layout() {
        addSubview(shimmeringView)

        NSLayoutConstraint.activate([
            shimmeringView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            shimmeringView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: shimmeringView.trailingAnchor, multiplier: 1),
            shimmeringView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func makeAnimationGroup(previousGroup: CAAnimationGroup? = nil) -> CAAnimationGroup {
        let animDuration: CFTimeInterval = 1
        let anim1 = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.backgroundColor))
        anim1.fromValue = UIColor.gradientLightGrey.cgColor
        anim1.toValue = UIColor.gradientDarkGrey.cgColor
        anim1.duration = animDuration
        anim1.beginTime = 0.0

        let anim2 = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.backgroundColor))
        anim2.fromValue = UIColor.gradientDarkGrey.cgColor
        anim2.toValue = UIColor.gradientLightGrey.cgColor
        anim2.duration = animDuration
        anim2.beginTime = anim1.beginTime + anim1.duration

        let group = CAAnimationGroup()
        group.animations = [anim1, anim2]
        group.repeatCount = .greatestFiniteMagnitude
        group.duration = anim2.beginTime + anim2.duration
        group.isRemovedOnCompletion = false

        if let previousGroup = previousGroup {
            group.beginTime = previousGroup.beginTime + 0.33
        }

        return group
    }
}

private extension UIColor {

    static var gradientDarkGrey: UIColor {
        UIColor.gray7
    }

    static var gradientLightGrey: UIColor {
        UIColor.gray8
    }
}

// MARK: - Preview

import SwiftUI

#Preview {
    SwiftUIPreview {
        CHMUIShimmeringView()
    }
    .frame(width: 150, height: 200)
}
