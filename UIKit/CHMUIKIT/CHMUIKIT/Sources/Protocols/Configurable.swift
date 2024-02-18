//
//  Configurable.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 08/12/2023.
//

import Foundation

protocol Configurable {
    associatedtype Configuration

    var configuration: Configuration { get set }
}
