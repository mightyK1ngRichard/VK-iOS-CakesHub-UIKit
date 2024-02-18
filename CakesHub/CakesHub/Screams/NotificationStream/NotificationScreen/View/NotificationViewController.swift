//
//  NotificationViewController.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 26/11/2023.
//  Copyright 2023 © VK Team CakesHub. All rights reserved.
//

import UIKit
import SwiftUI

final class NotificationViewController: UIViewController, ViewModelable {
    
    // MARK: Coordinator
    
    weak var coordinator: NotificationViewControllerCoordinator?
    
    // MARK: View Model
    
    var viewModel: NotificationViewModel
    var user: UserModel!
    
    // MARK: Lifecycle
    
    init(
        viewModel: NotificationViewModel,
        user: UserModel
    ) {
        self.viewModel = viewModel
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup

private extension NotificationViewController {
    
    func setup() {
        edgesForExtendedLayout = []
        navigationController?.navigationBar.isHidden = true
        let hostView = UIHostingController(
            rootView: NotificationView(user: user)
        )
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(hostView.view)
        NSLayoutConstraint.activate([
            hostView.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - Preview

#Preview {
    NotificationViewController(viewModel: NotificationViewModel(), user: .mockData)
}
