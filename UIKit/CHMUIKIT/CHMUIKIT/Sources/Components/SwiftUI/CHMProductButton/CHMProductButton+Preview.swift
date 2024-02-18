//
//  CHMProductButton+Preview.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 20.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMProductButtonPreview: PreviewProvider {
    
    static var previews: some View {
        VStack(spacing: 20) {
            CHMProductButton(
                configuration: .basic(kind: .basket)
            ) {
                print("Button did tap")
            }

            CHMProductButton(
                configuration: .basic(kind: .favorite)
            ) {
                print("Button did tap")
            }

            CHMProductButton(
                configuration: modify(.basic(kind: .favorite)) {
                    $0.iconColor = .red
                }
            )
        }
    }
}
