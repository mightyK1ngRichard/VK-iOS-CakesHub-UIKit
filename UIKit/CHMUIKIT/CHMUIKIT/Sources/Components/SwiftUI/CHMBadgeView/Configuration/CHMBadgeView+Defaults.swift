//
//  CHMBadgeView+Defaults.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 20.01.2024.
//

import SwiftUI

public extension CHMBadgeView.Configuration {

    static let clear = Self()

    static func basic(
        text: String,
        kind: Kind = .red
    ) -> Self {
        modify(.clear) {
            $0.text            = text
            $0.backgroundColor = kind.backgroundColor
            $0.foregroundColor = .white
            $0.backgroundEdges = .backgroundEdges
            $0.cornerRadius    = .cornerRadius
        }
    }
}

// MARK: - Constants

private extension CGFloat {

    static let cornerRadius: CGFloat = 29
    static let fontSize: CGFloat = 11
}

private extension EdgeInsets {

    static let backgroundEdges = EdgeInsets(top: 7, leading: 6, bottom: 6, trailing: 6)
}
