//
//  LabelConfiguration.swift
//  CHMUIKIT
//
//  Created by Дмитрий Пермяков on 06.10.2023.
//

import UIKit

public struct LabelConfiguration: Hashable {

    public var attributedString: NSAttributedString
    var numberOfLines: Int = .zero
    var lineBreakMode: NSLineBreakMode = .byWordWrapping
}

// MARK: - Clear Configration

public extension LabelConfiguration {

    /// Default clear configuration
    static let clear = LabelConfiguration(attributedString: NSAttributedString())
}

// MARK: - Internal Configuration

extension LabelConfiguration {

    static func basic(
        attributedString: NSAttributedString,
        additionalAttachment: NSTextAttachment? = nil
    ) -> LabelConfiguration {
        modify(.clear) { configuration in
            let resultAttributedString = NSMutableAttributedString(attributedString: attributedString)
            defer {
                configuration.attributedString = resultAttributedString
            }
            guard let additionalAttachment else { return }
            resultAttributedString.append(NSAttributedString(string: .space))
            resultAttributedString.append(NSAttributedString(attachment: additionalAttachment))
        }
    }
}

// MARK: - Internal Computed Properties

extension LabelConfiguration {

    var isEmpty: Bool {
        attributedString.string.isEmpty
    }
}
