//
//  UIViewPreview.swift
//  CHMUIKIT
//
//  Created by Дмитрий Пермяков on 06.10.2023.
//

import SwiftUI

struct SwiftUIPreview<uiView: UIView> {

    private let builder: () -> uiView
    init(_ builder: @escaping () -> uiView) {
        self.builder = builder
    }
}

// MARK: - UIViewRepresentable

extension SwiftUIPreview: UIViewRepresentable {

    func makeUIView(context: Context) -> UIView {
        builder()
    }

    func updateUIView(_ view: UIView, context: Context) {}
}

extension SwiftUIPreview {

    func fittingSize(width: CGFloat = .zero) -> some View {
        let size = builder().systemLayoutSizeFitting(
            CGSize(width: width, height: .zero),
            withHorizontalFittingPriority: width == .zero ? .defaultLow : .required,
            verticalFittingPriority: .fittingSizeLevel
        )
        return frame(width: max(width, size.width), height: size.height, alignment: .center)
    }
}
