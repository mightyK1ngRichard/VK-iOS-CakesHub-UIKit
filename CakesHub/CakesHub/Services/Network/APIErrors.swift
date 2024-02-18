//
//  APIErrors.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 26/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import Foundation

enum APIError: LocalizedError {
    case badParameters
    case dataIsNil
    case badStatusCode(Int)
    case error(Error)
    case responseIsNil
    case incorrectlyURL

    var errorDescription: String {
        switch self {
        case .badParameters: return "Query parameters are incorrectly"
        case .dataIsNil: return "data is nil"
        case .responseIsNil: return "response is nil"
        case .badStatusCode(let code): return "Bad statuc code: \(code)"
        case .error(let error): return error.localizedDescription
        case .incorrectlyURL: return "URL is incorrectly"
        }
    }
}
