//
//  Divider.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 14/11/2023.
//

import UIKit

public func generateDivider() -> UIView {
    UIView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: .dividerHeigth).isActive = true
        $0.backgroundColor = .grayLightGray
    }
}

// MARK: - Constants

private extension CGFloat {

    static let dividerHeigth: CGFloat = 1
}
