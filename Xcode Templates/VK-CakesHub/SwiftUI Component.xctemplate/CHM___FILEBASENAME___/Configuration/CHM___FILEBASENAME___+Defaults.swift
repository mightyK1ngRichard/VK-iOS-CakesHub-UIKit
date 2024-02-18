//
//  CHM___VARIABLE_productName:identifier___+Defaults.swift
//  CHMUIKIT
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___YEAR___ © VK Team CakesHub. All rights reserved.
//

import Foundation

public extension CHM___VARIABLE_productName:identifier___.Configuration {

    /// Basic configuration
    static let clear = CHM___VARIABLE_productName:identifier___.Configuration()

    /// Basic configuration
    /// - Parameters:
    ///   - imageKind: image kind
    ///   - imageSize: image size
    /// - Returns: configuration of the view
    static func basic(
        imageKind: MKRImageView.Configuration.ImageKind,
        imageSize: CGSize
    ) -> Self {
        modify(.clear) {
            $0.imageConfiguration = .imageConfiguration(imageKind, imageSize)
        }
    }
}

#warning("Добавьте все необходимые дефолт конфиги")
// MARK: - MKRImageView Configuration

private extension MKRImageView.Configuration {

    static func imageConfiguration(_ kind: MKRImageView.Configuration.ImageKind, _ imageSize: CGSize) -> Self {
        .basic(
            kind: kind,
            imageSize: imageSize,
            imageShape: .roundedRectangle(9)
        )
    }
}


// MARK: - Constants

#warning("Добавьте все константы, которые будете использовать в конфигурациях выше")
private extension CGFloat {

    static let viewSize: CGFloat = 32
}
