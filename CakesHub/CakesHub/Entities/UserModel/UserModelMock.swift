//
//  UserModelMock.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 26/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import Foundation

extension UserModel {
    
    static let mockData = UserModel(
        id: "fATeLr4rM4HMDsHJMQjw",
        nickname: "@mightyK1ngRichard",
        name: "Dmitriy",
        surname: "Permyakov",
        birthdate: "14/03/2003",
        imageURL: .kingAvatar,
        phone: "+7 (912) 243-234-43"
    )
}

private extension URL? {
    
    static let kingAvatar = URL(string: "https://sun9-76.userapi.com/impg/9UT7SzAC_gHL2GBES69P-hXudzqKmS8_f0oPXA/AN2fmitt7Bs.jpg?size=1080x1920&quality=95&sign=812fa659cab85e0be2fc74516dc27ae7&type=album")
}
