//
//  NSObjectProtocol+Extensions.swift
//  CHMUIKIT
//
//  Created by Дмитрий Пермяков on 06.10.2023.
//

import Foundation

public extension NSObjectProtocol {

    @discardableResult
    func with(_ closure: (Self) -> Void) -> Self {
        closure(self)
        return self
    }
}
