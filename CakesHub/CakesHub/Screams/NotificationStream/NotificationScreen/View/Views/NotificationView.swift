//
//  NotificationView.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 26/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct NotificationView: View {
    @ObservedObject var viewModel = NotificationViewModel()
    
    init(user: UserModel) {
        self.viewModel.user = user
    }
    
    var body: some View {
        MainView
            .environmentObject(viewModel)
            .preferredColorScheme(.dark)
            .onAppear {
                viewModel.setupWebSocket()
            }
    }
}

// MARK: - Views

private extension NotificationView {
    
    @ViewBuilder
    var MainView: some View {
        if !viewModel.showNotificationScreen {
            ProgressScreen
        } else if viewModel.countNotifications == 0 {
            NotificationsNotFound
        } else {
            ScrollScreen
        }
    }
    
    var ScrollScreen: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(viewModel.notifications) { notification in
                    NotificationCell(notification: notification) { id in
                        viewModel.deleteNotification(id: id) {
                            switch $0 {
                            case .success:
                                print("SUCCESS")
                            case .failure(let error):
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
            }
        }
    }
    
    var ProgressScreen: some View {
        VStack {
            ForEach(0...5, id: \.self) { _ in
                ShimmeringView()
                    .frame(maxWidth: .infinity, maxHeight: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            Spacer()
        }
    }
    
    var NotificationsNotFound: some View {
        VStack {
            Image("not_found")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            
            Text("Уведомлений нет!")
                .font(.headline)
                .padding(.top)
        }
    }
}

// MARK: - Preview

#Preview {
    NotificationView(user: .mockData)
        .environmentObject(NotificationViewModel())
}
