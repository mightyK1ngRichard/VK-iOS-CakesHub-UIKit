//
//  AuthService.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 27.12.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

// MARK: - AuthServiceProtocol

protocol AuthServiceProtocol {
    func registeUser(with userRequest: RegisterUserRequest, completion: @escaping CHMResultBlock<Bool, APIError>)
    func loginUser(with userRequest: LoginUserRequest, completion: @escaping CHMResultBlock<String, APIError>)
    func logoutUser(completion: @escaping (Error?) -> Void)
}

// MARK: - AuthService

final class AuthService {

    static var shared = AuthService()
    private var auth = Auth.auth()

    private init() {}
}

// MARK: - Methods

extension AuthService: AuthServiceProtocol {

    /// Registration
    /// - Parameters:
    ///   - userRequest: user input info
    ///   - completion: search result
    func registeUser(with userRequest: RegisterUserRequest, completion: @escaping CHMResultBlock<Bool, APIError>) {
        auth.createUser(withEmail: userRequest.email, password: userRequest.password) { result, error in
            if let error {
                asyncMain { completion(.failure(.error(error))) }
                return
            }
            guard let user = result?.user else {
                asyncMain { completion(.failure(.dataIsNil)) }
                return
            }
            let db = Firestore.firestore()
            db.collection(FirestoreCollections.users.rawValue)
                .document(user.uid)
                .setData([
                    "nickname": userRequest.nickname,
                    "email": userRequest.email
                ]) { error in
                    if let error {
                        asyncMain { completion(.failure(.error(error))) }
                        return
                    }
                    asyncMain { completion(.success(true)) }
                }
        }
    }

    /// User Authentication
    /// - Parameters:
    ///   - userRequest: user input info
    ///   - completion: login result
    func loginUser(with userRequest: LoginUserRequest, completion: @escaping CHMResultBlock<String, APIError>) {
        auth.signIn(withEmail: userRequest.email, password: userRequest.password) { result, error in
            if let error {
                asyncMain { completion(.failure(.error(error))) }
                return
            }
            guard let user = result?.user else {
                asyncMain { completion(.failure(.dataIsNil)) }
                return
            }
            asyncMain { completion(.success(user.uid)) }
        }
    }

    /// Logout session
    /// - Parameter completion: user logout result
    func logoutUser(completion: @escaping (Error?) -> Void) {
        do {
            try auth.signOut()
            completion(nil)
        } catch {
            completion(error)
        }
    }
}
