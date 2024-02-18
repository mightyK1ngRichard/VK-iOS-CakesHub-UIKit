//
//  MKRImageView.swift
//  MKRDesignSystem
//
//  Created by Dmitriy Permyakov on 31.12.2023.
//

import SwiftUI

public struct MKRImageView: View {

    public let configuration: Configuration

    public init(configuration: Configuration) {
        self.configuration = configuration
    }
    
    public var body: some View {
        ImageView
    }
}

private extension MKRImageView {

    @ViewBuilder
    var ImageView: some View {
        switch configuration.kind {
        case let .url(url):
            if let url {
                AsyncImage(url: url) { image in
                    image
                        .imageConfiguaration(for: configuration)

                } placeholder: {
                    ShimmeringView()
                        .frame(
                            width: configuration.imageSize.width,
                            height: configuration.imageSize.height
                        )
                        .clippedShape(configuration.imageShape)
                }
            } else {
                PlaceholderView
            }

        case let .image(image):
            if let image {
                image
                    .imageConfiguaration(for: configuration)
            } else {
                PlaceholderView
            }

        case let .uiImage(uiImage):
            if let uiImage {
                Image(uiImage: uiImage)
                    .imageConfiguaration(for: configuration)
            } else {
                PlaceholderView
            }

        case .clear:
            EmptyView()
        }
    }

    var PlaceholderView: some View {
        Rectangle()
            .fill(.pink)
            .frame(
                width: configuration.imageSize.width,
                height: configuration.imageSize.height
            )
            .clippedShape(configuration.imageShape)
    }
}

// MARK: - Image Configuration

private extension Image {

    func imageConfiguaration(for configuration: MKRImageView.Configuration) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: configuration.contentMode)
            .frame(
                width: configuration.imageSize.width,
                height: configuration.imageSize.height
            )
            .clipped()
            .clippedShape(configuration.imageShape)
    }
}

// MARK: - Preview

#Preview {
    MKRImageView(
        configuration: .basic(
            kind: .url(.mockCake1),
            imageSize: CGSize(width: 200, height: 200),
            imageShape: .roundedRectangle(20)
        )
    )
}
