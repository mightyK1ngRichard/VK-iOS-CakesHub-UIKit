//
//  CHMThroughDataImageResolver.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 10/10/2023.
//

import UIKit

/// Error of  `CHMThroughDataImageResolver`
public enum CHMThroughDataImageResolverError: Error {
    case emptyUrl, emptyData
}

final class CHMThroughDataImageResolver {

    private init() {}

    static let shared = CHMThroughDataImageResolver()

    func loadImage(
        url: URL?,
        completion: @escaping (Result<UIImage?, Error>) -> Void
    ) {
        guard let url else {
            completion(.failure(CHMThroughDataImageResolverError.emptyUrl))
            return
        }

        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            guard let data else {
                DispatchQueue.main.async {
                    completion(.failure(CHMThroughDataImageResolverError.emptyData))
                }
                return
            }
            DispatchQueue.main.async {
                completion(.success(UIImage(data: data)))
            }
        }.resume()
    }
}
