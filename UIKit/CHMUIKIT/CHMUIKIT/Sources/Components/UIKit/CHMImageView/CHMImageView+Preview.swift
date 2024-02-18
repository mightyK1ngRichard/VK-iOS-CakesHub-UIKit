//
//  CHMImageView.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 10/10/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMImageViewPreview: PreviewProvider {

    static var previews: some View {
        Group {
            DefaultView
            ShapesView
            EmptyView
            PhotoView
        }
    }
}

private extension CHMImageViewPreview {
    
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
