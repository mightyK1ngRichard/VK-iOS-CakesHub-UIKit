//
//  UserModel.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 26/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import Foundation

struct UserModel {
    let id: String
    let nickname: String
    let name: String?
    let surname: String?
    let birthdate: String?
    let imageURL: URL?
    let phone: String?
}
