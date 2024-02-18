//
//  UIColors+Preview.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 29/11/2023.
//

import SwiftUI

struct UIColors_Preview: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                BackgroundColors
                TextColors
            }
            .padding(.horizontal, 20)
        }
    }
}

private extension UIColors_Preview {

    @ViewBuilder
    var BackgroundColors: some View {
        let colors: [(String, UIColor)] = [
            ("whiteBlack", .whiteBlack),
            ("whiteLightGray", .whiteLightGray),
            ("whiteLightGray", .whiteLightGray),
            ("whiteConst", .whiteConst)
        ]
        VStack {
            Text("Backgrounds").bold()
            ScrollView {
                ForEach(colors, id: \.self.0) { colorName, color in
                    VStack(spacing: 2) {
                        Text(colorName)
                        Rectangle()
                            .fill(Color(uiColor: color))
                            .frame(width: 200, height: 50)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
        }
    }

    @ViewBuilder
    var TextColors: some View {
        let colors: [(String, UIColor)] = [
            ("primary", .primary),
            ("secondary", .secondary),
            ("tertiary", .tertiary),
            ("whiteConst", .whiteConst),
            ("blackConst", .blackConst),
            ("textLink", .textLink),
            ("success", .success),
            ("warning", .warning),
            ("danger", .danger),
            ("wild", .wild),
        ]
        VStack {
            Text("TextColors").bold()
            ScrollView {
                ForEach(colors, id: \.self.0) { colorName, color in
                    VStack(spacing: 2) {
                        Text(colorName)
                            .foregroundStyle(Color(uiColor: color))
                        Rectangle()
                            .fill(Color(uiColor: color))
                            .frame(width: 200, height: 50)
                    }
                }
                .padding()
                .background(.mint)
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    UIColors_Preview()
}
