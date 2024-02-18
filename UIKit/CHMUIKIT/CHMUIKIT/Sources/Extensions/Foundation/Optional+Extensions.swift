//
//  Optional+Extensions.swift
//  CakeHubApplication
//
//  Created by Дмитрий Пермяков on 04.10.2023.
//

import Foundation

public extension Optional {

    var isNil: Bool { self == nil }
}

public extension Optional where Wrapped == String {

    var isEmptyOrNil: Bool {
        self == nil || self == ""
    }
}
