//
//  FirebaseManager.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 27.12.2023.
//

import Foundation

final class FirebaseManager {

    let authService: AuthService
    let cakeService: CakeService

    init(auth: AuthService = AuthService.shared, cake: CakeService = CakeService.shared) {
        self.authService = auth
        self.cakeService = cake
    }
}
