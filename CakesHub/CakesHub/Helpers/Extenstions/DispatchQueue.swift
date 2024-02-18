//
//  DispatchQueue.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 27/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import Foundation
import CHMUIKIT

func asyncMain(completion: @escaping CHMVoidBlock) {
    DispatchQueue.main.async(execute: completion)
}

func delay(_ delay: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: closure)
}
