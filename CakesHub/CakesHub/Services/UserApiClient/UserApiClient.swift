//
//  UserApiClient.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 03/12/2023.
//

import Foundation

// MARK: - UserApiClientProtocol

protocol UserApiClientProtocol {
    func login(completion: @escaping CHMResultBlock<UserModel, APIError>)
    func register(completion: @escaping CHMResultBlock<UserModel, APIError>)
}

// MARK: - UserApiClient

final class UserApiClient {
    
    static var shared = UserApiClient()
    var user: UserModel?

    private init() {}
}

// MARK: - Methods

extension UserApiClient: UserApiClientProtocol {
    
    /// Аутентификация пользователя
    /// - Parameter completion: блок с информаций о пользовале
    func login(completion: @escaping CHMResultBlock<UserModel, APIError>) {
        delay(1) {
            /// Запрос в интернет ...
            let user: UserModel = .mockData
            self.user = user
            completion(.success(user))
        }
    }
    
    /// Регистрация пользователя
    /// - Parameter completion: блок с информаций о пользовале
    func register(completion: @escaping CHMResultBlock<UserModel, APIError>) {
        delay(1) {
            /// Запрос в интернет ...
            let user: UserModel = .mockData
            self.user = user
            completion(.success(user))
        }
    }
}
