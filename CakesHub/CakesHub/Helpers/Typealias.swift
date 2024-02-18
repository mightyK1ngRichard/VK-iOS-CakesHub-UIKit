//
//  Typealias.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 03/12/2023.
//

import Foundation

typealias CHMVoidBlock = () -> Void
typealias CHMIntBlock = (Int) -> Void
typealias CHMBoolBlock = (Bool) -> Void
typealias CHMResultBlock<T, ErrorType: Error> = (Result<T, ErrorType>) -> Void
