//
//  Dictionary+Extensions.swift
//  CHMUIKIT
//
//  Created by Дмитрий Пермяков on 06.10.2023.
//

import UIKit

public extension Dictionary where Key == NSAttributedString.Key, Value == Any {

    static func attributes(
        style: CustomFont,
        textColor: UIColor,
        alignment: NSTextAlignment = .left
    ) -> [NSAttributedString.Key: Any] {
        let lineHeight = style.lineHeight
        let font = style.font
        let mutablePraragraphStyle = NSMutableParagraphStyle()
        mutablePraragraphStyle.minimumLineHeight = lineHeight
        mutablePraragraphStyle.maximumLineHeight = lineHeight
        mutablePraragraphStyle.alignment = alignment
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: textColor,
            .baselineOffset: (lineHeight - font.lineHeight) / 2,
            .paragraphStyle: mutablePraragraphStyle
        ]
        return attributes
    }
}
