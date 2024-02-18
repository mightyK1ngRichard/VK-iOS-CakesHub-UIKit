//
//  CHMStarsView+Preview.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 20.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMStarsViewPreview: PreviewProvider {
    
    static var previews: some View {
        Group {
            VStack(spacing: 20) {
                CHMStarsView(
                    configuration: .basic(kind: .zero)
                )
                
                CHMStarsView(
                    configuration: .basic(kind: .one)
                )
                
                CHMStarsView(
                    configuration: .basic(kind: .two)
                )
                
                CHMStarsView(
                    configuration: .basic(kind: .three)
                )
                
                CHMStarsView(
                    configuration: .basic(kind: .four)
                )
                
                CHMStarsView(
                    configuration: .basic(kind: .five)
                )
                
                CHMStarsView(
                    configuration: .basic(kind: .four, feedbackCount: 10)
                )
            }
            .previewDisplayName("Default")
            
            VStack(spacing: 30) {
                CHMStarsView(
                    configuration: modify(.basic(kind: .two)) {
                        $0.starWidth = 40
                        $0.padding = 10
                    }
                )
                
                CHMStarsView(
                    configuration: modify(.basic(kind: .two, feedbackCount: 22)) {
                        $0.starWidth = 40
                        $0.padding = 10
                        $0.lineHeigth = 30
                        $0.leftPadding = 10
                    }
                )
            }
            .previewDisplayName("Modify")
        }
    }
}
