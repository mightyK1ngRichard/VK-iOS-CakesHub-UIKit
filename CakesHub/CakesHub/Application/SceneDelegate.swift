//
//  SceneDelegate.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 10/10/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        guard let window else { return }
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
    }
}
