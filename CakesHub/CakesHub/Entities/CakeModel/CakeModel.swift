//
//  CakeModel.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 13/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit
import CHMUIKIT

struct CakeModel: Identifiable {
    let id: String
    var name: String?
    var price: String?
    var description: String?
    var images: ImageKind
    var seller: UserModel?
}

// MARK: - ImageKind

extension CakeModel {

    enum ImageKind {
        case url([URL?])
        case image([UIImage?])
    }
}

extension CakeModel.ImageKind {

    var count: Int {
        switch self {
        case .url(let images):
            return images.count
        case .image(let images):
            return images.count
        }
    }

    var getUIImages: [UIImage?]? {
        switch self {
        case .image(let images):
            return images
        default:
            return nil
        }
    }

    var getURLs: [URL?]? {
        switch self {
        case .url(let urls):
            return urls
        default:
            return nil
        }
    }

    var productImages: CHMProductCard.Configuration.ImageKind {
        switch self {
        case .url(let urls):
            return .url(urls)
        case .image(let images):
            return .image(images)
        }
    }
}

// MARK: - CakeCategory

extension CakeModel {

    enum CakeCategory {
        case birthday
    }
}
