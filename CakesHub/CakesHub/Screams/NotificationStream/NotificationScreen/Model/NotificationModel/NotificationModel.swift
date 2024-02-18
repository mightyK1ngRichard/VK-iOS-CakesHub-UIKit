//
//  NotificationModel.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 26/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import Foundation

struct NotificationModel: Identifiable {
    let id: Int
    var title: String
    var text: String
    var date: Date
    var userID: Int
    var sellerID: Int
    var isRead: Bool
}

// MARK: - Entity

struct NotificationResponseEntity: Decodable {
    let count: Int
    let notifications: [NotificationEntity]
}

struct NotificationEntity: Decodable {
    var id: Int
    var title: String
    var text: String
    var date: String
    var userID: Int
    var sellerID: Int
    var isRead: Bool
}

extension NotificationEntity {
    
    var mapper: NotificationModel {
        NotificationModel(
            id: id,
            title: title,
            text: text,
            date: date.toDate,
            userID: userID,
            sellerID: sellerID,
            isRead: isRead
        )
    }
}
