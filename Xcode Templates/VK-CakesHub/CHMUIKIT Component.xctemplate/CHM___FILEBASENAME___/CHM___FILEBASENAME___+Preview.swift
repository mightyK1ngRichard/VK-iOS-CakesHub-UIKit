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
            SwiftUIPreview {
                CHM___VARIABLE_productName:identifier___(
                    configuration: .basic(
                        .mockLoadingUrl,
                        imageKind: .capsule
                    )
                )
            }
            .previewDisplayName("Default")
            .frame(width: 200, height: 200)
        }
    }
}
