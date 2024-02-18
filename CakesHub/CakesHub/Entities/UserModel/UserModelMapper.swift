//
//  UserModelMapper.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 27.12.2023.
//

import Firebase

extension DocumentSnapshot {
    
    var mapperToUserModel: UserModel {
        let sellerID = documentID
        let sellerNickname = get("nickname") as? String
        let sellerName = get("name") as? String
        let sellerSurname = get("surname") as? String
        let sellerBirthdate = get("birthdate") as? String
        let sellerImageURL = get("imageURL") as? String
        let sellerPhone = get("phone") as? String
        
        return UserModel(
            id: sellerID,
            nickname: sellerNickname ?? "Не задан",
            name: sellerName,
            surname: sellerSurname,
            birthdate: sellerBirthdate,
            imageURL: sellerImageURL?.toURL,
            phone: sellerPhone
        )
    }
}
