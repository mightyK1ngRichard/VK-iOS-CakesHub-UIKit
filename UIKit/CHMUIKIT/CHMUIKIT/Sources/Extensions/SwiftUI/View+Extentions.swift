//
//  View+Extentions.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 20.01.2024.
//

import SwiftUI

extension View {

    func frame(edge size: CGFloat) -> some View {
        self.frame(width: size, height: size)
    }
}
