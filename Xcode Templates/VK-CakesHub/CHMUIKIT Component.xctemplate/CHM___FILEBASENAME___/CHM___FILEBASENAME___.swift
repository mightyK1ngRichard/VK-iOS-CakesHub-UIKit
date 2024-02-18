//
//  CHM___VARIABLE_productName:identifier___.swift
//  CHMUIKIT
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___YEAR___ © VK Team CakesHub. All rights reserved.
//

import UIKit

#warning("Добавьте пример вызова вашего компонента для документации")
/**
 Component `CHMLabel`

 For example:
 ```swift
 let view = CHMLabel(
     configuration: .basic(
         .mockLoadingUrl,
         imageKind: .capsule
     )
 )
 ```
*/
public final class CHM___VARIABLE_productName:identifier___: UIView {

    // MARK: Public Properties
    
    /// Configuration of the view
    public var configuration: Configuration {
        didSet {
            updateConfiguration()
        }
    }

    // MARK: Private UI Properties

    #warning("Установите все необходимые вьюшки")
    private lazy var imageView = CHMImageView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: Lifecycle

    public init(configuration: Configuration = .clear) {
        self.configuration = configuration
        super.init(frame: .zero)
        setup()
    }

    public override init(frame: CGRect) {
        self.configuration = .clear
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        self.configuration = .clear
        super.init(coder: coder)
        setup()
    }
}

// MARK: - Private Methods

private extension CHM___VARIABLE_productName:identifier___ {

    func setup() {
        backgroundColor = .clear
        addSubview(imageView)
        addConstraints()
        updateConfiguration()
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func updateConfiguration() {
        #warning("Обновите все необходимые конфигурации")
        imageView.configuration = configuration.imageViewConfiguration
    }
}
