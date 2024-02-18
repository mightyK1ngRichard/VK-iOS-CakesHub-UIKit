//
//  CHMCommentView+Preview.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 27.01.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI

struct CHMCommentViewPreview: PreviewProvider {
    
    static var previews: some View {
        Group {
            CHMCommentView(
                configuration: .basic(
                    imageKind: .url(.mockProductCard),
                    userName: "description: String",
                    date: "June 5, 2019",
                    description: .description,
                    starsConfiguration: .basic(kind: .four, feedbackCount: 21)
                )
            )
            .previewDisplayName("Basic")
        }
    }
}

// MARK: - Constants

private extension String {

    static let description = """
    The dress is great! Very classy and comfortable. It fit perfectly! I'm 5'7" and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn't recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well.
    """
}
