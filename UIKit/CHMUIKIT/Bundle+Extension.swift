//
//  Bundle+Extension.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 12/11/2023.
//

private class BundleFinder {}

extension Bundle {

    static let module: Bundle = Bundle(for: BundleFinder.self)
}
