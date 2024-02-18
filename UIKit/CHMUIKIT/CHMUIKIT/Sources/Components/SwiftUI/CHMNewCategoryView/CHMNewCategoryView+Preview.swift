//
//  CHMNewCategoryView+Preview.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 27.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMNewCategoryViewPreview: PreviewProvider {
    
    static var previews: some View {
        Group {
            CHMNewCategoryView(
                configuration: .basic(
                    imageKind: .uiImage(.category_2),
                    title: "Clothes"
                )
            )
            .previewDisplayName("Basic")
        }
    }
}
