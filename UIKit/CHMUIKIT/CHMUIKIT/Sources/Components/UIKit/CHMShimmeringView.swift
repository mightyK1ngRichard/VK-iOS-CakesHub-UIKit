//
//  CHMShimmeringView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 31.01.2024.
//

import SwiftUI
import UIKit

// MARK: - Shimmering extenstion

public enum ShimmerViews: Int {
    case backgroundView = 1234
    case shimmerView = 123
}

extension UIView {
    func createUIView(withTag tag: ShimmerViews, backgroundColor color: UIColor, cornerRadius: CGFloat) -> UIView {
        let view = UIView(frame: bounds)
        view.tag = tag.rawValue
        view.backgroundColor = color
        view.layer.cornerRadius = cornerRadius
        view.layer.masksToBounds = true
        return view
    }

    func startShimmer(cornerRadius: CGFloat) {
        func setShimmerEffectInto(view shimmerView: UIView) {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.withAlphaComponent(0.8).cgColor, UIColor.clear.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.7, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.8)
            gradientLayer.frame = shimmerView.bounds
            shimmerView.layer.mask = gradientLayer

            let animation = CABasicAnimation(keyPath: "transform.translation.x")
            animation.duration = 1.5
            animation.fromValue = -shimmerView.frame.width
            animation.toValue = shimmerView.frame.width
            animation.repeatCount = .infinity

            gradientLayer.add(animation, forKey: "")
        }

        let shimmerView = createUIView(withTag: .shimmerView, backgroundColor: UIColor.systemGray5, cornerRadius: cornerRadius)
        let backgroundView = createUIView(withTag: .backgroundView, backgroundColor: .grayDarkGray, cornerRadius: cornerRadius)

        addSubview(backgroundView)
        addSubview(shimmerView)
        shimmerView.clipsToBounds = true
        backgroundView.clipsToBounds = true

        setShimmerEffectInto(view: shimmerView)
    }

    func stopShimmer() {
        viewWithTag(ShimmerViews.backgroundView.rawValue)?.removeFromSuperview()
        viewWithTag(ShimmerViews.shimmerView.rawValue)?.removeFromSuperview()
    }
}
