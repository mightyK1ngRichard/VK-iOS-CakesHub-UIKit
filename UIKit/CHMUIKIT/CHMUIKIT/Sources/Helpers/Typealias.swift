//
//  Typealias.swift
//  CHMUIKIT
//
//  Created by Дмитрий Пермяков on 06.10.2023.
//

import SwiftUI
import UIKit

public typealias CHMVoidBlock = () -> Void
public typealias CHMViewBlock<T: UIView> = (T) -> Void
public typealias CHMIntBlock = (Int) -> Void
public typealias CHMBoolBlock = (Bool) -> Void
public typealias CHMGenericBlock<T> = (T) -> Void
public typealias CHMBinding<T> = (Binding<T>) -> Void
