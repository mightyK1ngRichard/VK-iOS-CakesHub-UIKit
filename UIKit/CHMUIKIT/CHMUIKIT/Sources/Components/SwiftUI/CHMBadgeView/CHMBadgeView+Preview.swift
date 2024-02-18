//
//  CHMBadgeView+Preview.swift
//  CHMUIKIT
//
//  Created by Dmitriy Permyakov on 20.01.2024.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            CHMBadgeView(configuration: .basic(text: "50%", kind: .dark))

            CHMBadgeView(configuration:  .basic(text: "-50%"))

            CHMBadgeView(configuration: .basic(text: "NEW", kind: .dark))

            CHMBadgeView(configuration: .basic(text: "TEXT"))
        }
    }
}
