//
//  Modified.swift
//  CHMUIKIT
//
//  Created by Дмитрий Пермяков on 06.10.2023.
//

import Foundation

public func modify<T>(_ value: T, _ modificator: (inout T) throws -> Void) rethrows -> T {
    var copy = value
    try modificator(&copy)
    return copy
}
