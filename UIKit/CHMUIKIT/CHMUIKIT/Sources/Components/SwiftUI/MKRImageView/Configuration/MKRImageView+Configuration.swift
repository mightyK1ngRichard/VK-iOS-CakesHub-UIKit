//
//  MKRImageView+Configuration.swift
//  MKRDesignSystem
//
//  Created by Dmitriy Permyakov on 31.12.2023.
//

import SwiftUI

public extension MKRImageView {

    struct Configuration {
        public var kind: ImageKind = .clear
        var imageShape: ImageShape = .capsule
        var imageSize: CGSize = .zero
        var contentMode: ContentMode = .fill
    }
}

// MARK: - Image Kind

public extension MKRImageView.Configuration {

    enum ImageKind {
        case url(URL?)
        case image(Image?)
        case uiImage(UIImage?)
        case clear
    }
}

// MARK: - Image Shape

extension MKRImageView.Configuration {

    public enum ImageShape {
        case capsule
        case rectangle
        case roundedRectangle(CGFloat)
    }
}

extension View {

    func clippedShape(_ shape: MKRImageView.Configuration.ImageShape) -> some View {
        switch shape {
        case .capsule:
            return AnyView(self.clipShape(Circle()))
        case .rectangle:
            return AnyView(self.clipShape(Rectangle()))
        case let .roundedRectangle(cornerRadius):
            return AnyView(self.clipShape(RoundedRectangle(cornerRadius: cornerRadius)))
        }
    }
}
