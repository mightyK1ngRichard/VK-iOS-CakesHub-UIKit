//
//  CHM___VARIABLE_productName:identifier___.swift
//  CHMUIKIT
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___YEAR___ © VK Team CakesHub. All rights reserved.
//

import SwiftUI

#warning("Добавьте пример вызова вашего компонента для документации")
/**
 Component `CHM___VARIABLE_productName:identifier___`

 For example:
 ```swift
 let view = CHM___VARIABLE_productName:identifier___(
     configuration: .basic(<#data#>)
 )
 ```
*/
public struct CHM___VARIABLE_productName:identifier___: View {

    let configuration: Configuration

    public var body: some View {
        VStack {
            MKRImageView(configuration: configuration.imageConfiguration)
        }
    }
}

// MARK: - Preview

#Preview {
    CHM___VARIABLE_productName:identifier___(
        configuration: .basic(
            imageKind: .url(.mockCake1),
            imageSize: CGSize(edge: 150)
        )
    )
}
