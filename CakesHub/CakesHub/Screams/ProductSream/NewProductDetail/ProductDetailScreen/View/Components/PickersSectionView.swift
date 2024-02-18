//
//  PickersSectionView.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 04.02.2024.
//

import SwiftUI
import CHMUIKIT

struct PickersSectionView: View {

    struct PickersItem: Identifiable, Hashable {
        var id = UUID()
        var title: String = .clear
    }

    var pickers: [PickersItem] = []
    @Binding var lastSelected: PickersItem?
    @State private var lastSelectedItem: UUID?

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(pickers) { picker in
                    Button {
                        lastSelectedItem = picker.id
                        lastSelected = picker
                    } label: {
                        PickerView(title: picker.title, id: picker.id)
                    }
                }
            }
            .padding(.vertical, 1)
            .padding(.horizontal)
        }
    }
}

// MARK: - Subivew

private extension PickersSectionView {

    func PickerView(title: String, id: UUID) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .tint(Color(hexLight: 0x222222, hexDarK: 0xF6F6F6))
                .padding(.leading, 12)
                .lineLimit(1)

            Image.chevronDown
                .renderingMode(.template)
                .frame(width: 16, height: 16)
                .rotationEffect(
                    lastSelectedItem == id ? Angle(degrees: 180) : Angle(degrees: 0)
                )
                .foregroundStyle(Color.iconColor)
                .padding(.trailing, 8)
                .padding(.leading, 16)
        }
        .frame(height: 40)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1)
                .fill(lastSelectedItem == id ? Color.selectedBorderColor : .unselectedBorderColor)
        )
    }
}

// MARK: - Preview

#Preview {
    PickersSectionView(
        pickers: [
            "Size",
            "Размер",
        ].map { .init(title: $0) },
        lastSelected: .constant(nil)
    )
}

// MARK: - Constants

private extension Color {

    static let iconColor = Color(uiColor: UIColor(hex: 0xABB4BD))
    static let selectedBorderColor = Color(hexLight: 0xF01F0E, hexDarK: 0xFF2424)
    static let unselectedBorderColor = Color(hexLight: 0x9B9B9B, hexDarK: 0xABB4BD)
}
