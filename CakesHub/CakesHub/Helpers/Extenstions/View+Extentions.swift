//
//  View+Extentions.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 04.02.2024.
//

import SwiftUI

extension View {

    func blurredSheet<Content: View>(
        _ style: AnyShapeStyle,
        show: Binding<Bool>,
        onDismiss: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        sheet(isPresented: show, onDismiss: onDismiss) {
            content()
                .background(RemovebackgroundColor())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Rectangle()
                        .fill(style)
                        .ignoresSafeArea(.container, edges: .all)
                )
        }
    }
}

// MARK: - Helper

struct RemovebackgroundColor: UIViewRepresentable {

    func makeUIView(context: Context) -> UIView {
        UIView()
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.async {
            uiView.superview?.superview?.backgroundColor = .clear
        }
    }
}

fileprivate struct CheckSheetView: View {
    @State private var show = true
    var body: some View {
        ZStack {
            Color.pink
            Button("SHOW") {
                show.toggle()
            }
        }
        .blurredSheet(
            .init(.ultraThinMaterial),
            show: $show) {

            } content: {
                Text("Seleccted!)")
                    .presentationDetents([.height(255)])
            }
    }
}

#Preview {
    CheckSheetView()
}
