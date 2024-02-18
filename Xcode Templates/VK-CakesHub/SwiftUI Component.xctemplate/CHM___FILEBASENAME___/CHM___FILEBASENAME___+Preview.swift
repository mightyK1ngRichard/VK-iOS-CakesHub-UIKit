//
//  CHM___VARIABLE_productName:identifier___+Preview.swift
//  CHMUIKIT
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___YEAR___ © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHM___VARIABLE_productName:identifier___Preview: PreviewProvider {
    
    static var previews: some View {
        Group {
            CHM___VARIABLE_productName:identifier___(
                configuration: .constant(
                    .basic(
                        imageKind: .url(.mockCake1),
                        imageSize: CGSize(edge: 200)
                    )
                )
            )
            .previewDisplayName("Basic")
        }
    }
}
