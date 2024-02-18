//
//  NotificationCell.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 26/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import SwiftUI
import CHMUIKIT

struct NotificationCell: View {
    
    var notification: NotificationModel!
    @State private var offsetX: CGFloat = .zero
    @State private var showTrash = false
    var deleteHandler: CHMIntBlock
    
    var body: some View {
        ZStack {
            if showTrash {
                Button {
                    deleteHandler(notification.id)
                    withAnimation {
                        offsetX = -400
                        showTrash = false
                    }
                } label: {
                    Image(systemName: "trash")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.foreground)
                        .frame(width: 30)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 30)
                }
            }
            
            NotificationCellView
                .offset(x: offsetX)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            if offsetX > -16 || -offsetX > .maxOffsetX { return }
                            withAnimation {
                                offsetX = value.translation.width
                            }
                        })
                        .onEnded({ value in
                            if -value.translation.width > .maxOffsetX {
                                withAnimation {
                                    offsetX = -.maxOffsetX
                                    showTrash = true
                                }
                            }
                            if -value.translation.width < 5 {
                                showTrash = false
                                withAnimation {
                                    offsetX = .zero
                                }
                            }
                        })
                )
        }
    }
}

// MARK: - Views

private extension NotificationCell {
    
    var NotificationCellView: some View {
        HStack(alignment: .center, spacing: 24) {
            VStack {
                Text(notification.title)
                    .leftAlignment
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                
                Text(notification.date.formatted(.dateTime.year().day().month(.wide)))
                    .leftAlignment
                    .font(.system(size: 12, weight: .medium, design: .serif))
                
                Text(notification.text)
                    .font(.system(size: 15, weight: .regular, design: .rounded))
                    .leftAlignment
                    .padding(.top, 3)
            }
        }
        .padding(.vertical, 20)
        .background(
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color.pink.opacity(0), location: 0.00),
                    Gradient.Stop(color: .purple.opacity(0.51), location: 1.00),
                ],
                startPoint: UnitPoint(x: 0, y: 0.72),
                endPoint: UnitPoint(x: 1.3, y: 0.75)
            )
        )
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(red: 0.2, green: 0.26, blue: 1).opacity(0), lineWidth: 1)
        )
        .overlay(alignment: .top) {
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [.blue, .blue, .clear],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(maxWidth: .infinity, maxHeight: 0.8)
                .padding(.trailing, 25)
        }
        .padding(.horizontal)
    }
    
    var BackgroundView: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.red)
    }
}

// MARK: - Preview

#Preview {
    NotificationCell(notification: .mock) { id in
        print("delete: \(id)")
    }
}

// MARK: - Constants

private extension CGFloat {
    
    static var maxOffsetX: CGFloat = 80
}

private extension View {
    
    var leftAlignment: some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
