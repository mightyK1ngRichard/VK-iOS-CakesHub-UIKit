//
//  NotificationModel+Mock.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 26/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import Foundation

extension NotificationModel {
    
    static let mock = NotificationModel(
        id: 0,
        title: "Доставка",
        text: "Вас ожидает доставщик торта по номеру заказа #12342",
        date: .now,
        userID: 2,
        sellerID: 1,
        isRead: false
    )
}

extension [NotificationModel] {
    
    static let mockData: Self = (0...15).map {
        NotificationModel(
            id: $0,
            title: "Доставка \($0)",
            text: "Вас ожидает доставщик торта по номеру заказа #\($0)",
            date: .now,
            userID: 2,
            sellerID: 1,
            isRead: false
        )
    }
}
