//
//  ImageConfiguration.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 10/10/2023.
//

import UIKit

public struct ImageConfiguration: Hashable {

    var kind: Kind = .image(nil)
    var placeholderColor: UIColor = .clear
}

// MARK: - Kind

public extension ImageConfiguration {

    /// Kind of the iimage source
    enum Kind: Hashable {
        case image(_ image: UIImage?, placeholder: Placeholder = .cake)
        case url(_ url: URL?, placeholder: Placeholder = .cake)
    }
}

public extension ImageConfiguration.Kind {
    
    /// Load image from network
    /// - Parameter completion: image
    func setImage(completion: @escaping (UIImage?) -> Void) {
        switch self {
        case .image(let image, _):
            completion(image)
            return
        case .url(let url, _):
            CHMThroughDataImageResolver.shared.loadImage(url: url) { result in
                switch result {
                case .success(let image):
                    completion(image)
                    return
                case .failure:
                    completion(nil)
                    return
                }
            }
        }
    }

    var placeholderImage: UIImage? {
        switch self {
        case .image(_, let placeholder):
            return placeholder.image
        case .url(_, let placeholder):
            return placeholder.image
        }
    }
}

// MARK: - Placeholder

public extension ImageConfiguration {
    
    /// Placeholder of the image view
    enum Placeholder: Hashable {
        case file
        case folder
        case image(UIImage?)
        case cake
        case profile
        case clear
    }
}

public extension ImageConfiguration.Placeholder {

    var image: UIImage? {
        switch self {
        case .file:
            return UIImage(systemName: "photo")
        case .profile:
            return UIImage(systemName: "person")
        case .folder:
            return UIImage(systemName: "folder")
        case .image(let image):
            return image
        case .clear:
            return nil
        case .cake:
            return UIImage(systemName: "birthday.cake.fill")
        }
    }
}

// MARK: - Clear Configuration

public extension ImageConfiguration {

    /// Default clear configuration
    static let clear = ImageConfiguration()
}
