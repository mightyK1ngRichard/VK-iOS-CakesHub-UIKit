//
//  CHMPicker+Preview.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 27.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMPickerPreview: View {

    @State private var isSelected = false
    var body: some View {
        VStack(spacing: 30) {
            CHMPicker(
                configuration: .basic("Размер"),
                handlerConfiguration: .init(
                    didTapView: { isSelected in
                        print("isSelected: \(isSelected)")
                    }
                ),
                isSelected: $isSelected
            )
        }
    }
}

#Preview {
    CHMPickerPreview()
}
