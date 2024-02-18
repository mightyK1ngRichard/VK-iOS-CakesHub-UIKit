//
//  LikeIcon.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 04.02.2024.
//

import SwiftUI

struct LikeIcon: View {

    @Binding var isSelected: Bool
    var didTapIcon: CHMVoidBlock? = nil

    var body: some View {
        ZStack {
            Circle()
                .fill(Color(hexLight: 0xFFFFFF, hexDarK: 0x2A2C36))

            Button {
                isSelected.toggle()
                didTapIcon?()
            } label: {
                if isSelected {
                    Image.favoritePressed
                } else {
                    Image.favoriteBorder
                }
            }
        }
        .frame(width: 36, height: 36)
        .shadow(color: Color(hexLight: 0x9B9B9B, hexDarK: 0xEF3651, alphaLight: 0.5, alphaDark: 0), radius: 10)
    }
}

#Preview {
    VStack {
        LikeIcon(isSelected: .constant(true))
        LikeIcon(isSelected: .constant(false))
    }
}
