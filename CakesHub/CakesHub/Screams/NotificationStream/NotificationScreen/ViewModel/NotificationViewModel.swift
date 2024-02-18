//
//  NotificationViewModel.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 26/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import SwiftUI
import Starscream
import CHMUIKIT

// MARK: - NotificationViewModelProtocol

protocol NotificationViewModelProtocol: AnyObject {
    
    func deleteNotification(id notificationID: Int, completion: @escaping CHMResultBlock<String?, APIError>)
}

// MARK: - NotificationViewModel

final class NotificationViewModel: ObservableObject, ViewModelProtocol {
    
    @Published var notifications: [NotificationModel] = []
    @Published var showNotificationScreen = false
    private let host = "192.168.1.37"
    private let port = 6070
    private var socket: WebSocket!
    var user: UserModel? = nil
    var countNotifications = 0
    
    func setupWebSocket() {
        guard let user else {
            print("======== ERROR: USER IS EMPTY ========")
            return
        }
        let urlString = "ws://\(host):\(port)/api/v1/notification/\(user.id)"
        guard let url = URL(string: urlString) else { return }
        socket = WebSocket(request: URLRequest(url: url))
        socket.delegate = self
        socket.connect()
    }
}

// MARK: - Actions

extension NotificationViewModel: NotificationViewModelProtocol {
    
    /// Пользователь нажал удаление сообщения
    /// - Parameters:
    ///   - notificationID: `id` уведомления
    ///   - completion: результат запроса
    func deleteNotification(
        id notificationID: Int,
        completion: @escaping CHMResultBlock<String?, APIError>
    ) {
        guard let url = URL(string: "http://\(host):\(port)/api/v1/notification/\(notificationID)") else { return }
        var request  = URLRequest(url: url)
        request.httpMethod = APIMethod.delete.rawValue
        URLSession.shared.dataTask(with: request) { _, response, error in
            if let error {
                asyncMain {
                    completion(.failure(.error(error)))
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                asyncMain {
                    completion(.failure(.responseIsNil))
                }
                return
            }
            
            if (200..<300).contains(httpResponse.statusCode) {
                asyncMain {
                    completion(.success(nil))
                }
                return
            }
            
            asyncMain {
                completion(.failure(.badStatusCode(httpResponse.statusCode)))
            }
        }.resume()
    }
}

// MARK: - WebSocketDelegate

extension NotificationViewModel: WebSocketDelegate {
    
    func didReceive(event: Starscream.WebSocketEvent, client: Starscream.WebSocketClient) {
        switch event {
        case .connected(let headers):
            print("======== WEBSOCKET ПОДКЛЮЧËН ========\n\(headers)")
        case .disconnected(let reason, let code):
            print("""
            ======== WEBSOCKET ОТКЛЮЧËН ========
            ПРИЧИНА: \(reason)
            КОД: \(code)
            """)
        case .text:
            break
        case .binary(let data):
            do {
                let response = try JSONDecoder().decode(NotificationResponseEntity.self, from: data)
                asyncMain {
                    self.notifications = response.notifications.map { $0.mapper }
                    self.countNotifications = response.count
                    self.showNotificationScreen = true
                }
            } catch {
                print("==> ERROR:", error)
            }
        case .ping:
            print("ping")
            break
        case .pong:
            print("pong")
            break
        case .viabilityChanged:
            print("viabilityChanged")
            break
        case .reconnectSuggested:
            print("reconnectSuggested")
            break
        case .cancelled:
            print("cancelled")
            break
        case .error(let error):
            print("==> ERROR:", error ?? "")
            break
        case .peerClosed:
            print("======== ТУНЕЛЬ ЗАКРЫТ ========")
            delay(5) {
                print("======== ПОВТОРНОЕ ПОДКЛЮЧЕНИЕ ========")
                self.setupWebSocket()
            }
            break
        }
    }
    
    func websocketDidConnect(socket: WebSocketClient) {
        print("WebSocket is connected")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("WebSocket is disconnected: \(error?.localizedDescription ?? "unknown error")")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print("Received message: \(text)")
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("Received data: \(data)")
    }
}
