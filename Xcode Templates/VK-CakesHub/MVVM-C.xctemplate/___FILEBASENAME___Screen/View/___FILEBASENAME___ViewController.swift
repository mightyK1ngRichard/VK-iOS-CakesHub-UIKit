//
//  ___VARIABLE_productName:identifier___ViewController.swift
//  CakesHub
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___YEAR___ © VK Team CakesHub. All rights reserved.
//

import UIKit
#warning("Удалите CHMIUKIT, если не используете ДС")
import CHMUIKIT

final class ___VARIABLE_productName:identifier___ViewController: UIViewController, ViewModelable {

    // MARK: Coordinator

    weak var coordinator: ___VARIABLE_productName:identifier___ViewControllerCoordinator?

    // MARK: View Model

    var viewModel: ___VARIABLE_productName:identifier___ViewModel

    // MARK: Private UI Properties
    
    #warning("Добавьте нееобходимые вьюшки")
    private lazy var <#viewName#> = <#CHMCustomView#>().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: Lifecycle

    init(viewModel: ___VARIABLE_productName:identifier___ViewModel) {
        self.viewModel = viewModel
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

// MARK: - Private Methods

private extension ___VARIABLE_productName:identifier___ViewController {

    func setup() {

    }
}

// MARK: - Preview

#Preview {
    ___VARIABLE_productName:identifier___ViewController(viewModel: .mockData)
}

// MARK: - Constants

#warning("Добавляйте сюда все необходимые констренты")
private extension String {

}
