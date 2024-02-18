//
//  CakeModelMockData.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 13/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

extension CakeModel {

    static var mockNilDataURl: CakeModel {
        CakeModel(
            id: "tMqq3tWoyTtkSisEi6pi",
            images: .url(.images.shuffled()),
            seller: .mockData
        )
    }

    static var mockDataNilImage: CakeModel {
        CakeModel(
            id: "tMqq3tWoyTtkSisEi6pi",
            images: .image(.images),
            seller: .mockData
        )
    }

    static var mockDataURl: CakeModel {
        CakeModel(
            id: "tMqq3tWoyTtkSisEi6pi",
            price: "10000",
            description: "Просто описание торта\nДорого богато",
            images: .url(.images.shuffled()),
            seller: .mockData
        )
    }

    static var mockDataImage: CakeModel {
        CakeModel(
            id: "tMqq3tWoyTtkSisEi6pi",
            price: "10000",
            description: "Просто описание торта\nДорого богато",
            images: .image(.images),
            seller: .mockData
        )
    }
}

// MARK: - ImageKind

extension CakeModel.ImageKind {

    static let mockDataImage: Self = .image(.images)
    static let mockDataURL: Self = .url(.images)
}

// MARK: - URL + UIImage

private extension [URL?] {

    static let images: Self = [
        .mockCake1,
        .mockCake2,
        .mockCake3,
        .mockCake4
    ]
}

private extension [UIImage?] {

    static let images: Self = Array(repeating: UIImage(named: "cake"), count: 6)
}
