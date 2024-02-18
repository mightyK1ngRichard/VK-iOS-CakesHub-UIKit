//
//  CakeModelMapper.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 27.12.2023.
//

import Firebase

// MARK: - DocumentSnapshot

extension DocumentSnapshot {
    
    func mapperToCakeModel(completion: @escaping CHMResultBlock<CakeModel, APIError>) {
        let cakeID = documentID
        let description = get("description") as? String
        let images: [String?] = get("images") as? [String?] ?? []
        let price = get("price") as? String
        let sellerReference = get("seller") as? DocumentReference
        
        sellerReference?.getDocument { seller, error in
            var cakeModel = CakeModel(
                id: cakeID, 
                price: price,
                description: description,
                images: .url(images.map { $0?.toURL }),
                seller: nil
            )
            guard let seller, error.isNil else {
                completion(.success(cakeModel))
                return
            }
            cakeModel.seller = seller.mapperToUserModel
            completion(.success(cakeModel))
        }
    }
}

// MARK: - CakeModel

extension CakeModel {
    
    func mapperToDictionaty(userID: String, images: [String]) -> [String: Any] {
        var cakeDict: [String: Any] = [:]
        cakeDict["price"] = price
        cakeDict["description"] = description
        cakeDict["images"] = images
        cakeDict["seller"] = Firestore.firestore()
            .collection(FirestoreCollections.users.rawValue)
            .document(userID)
        return cakeDict
    }
}
