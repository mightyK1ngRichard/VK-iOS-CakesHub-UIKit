//
//  UIViewController+Extenstions.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 28.01.2024.
//

import UIKit
import SwiftUI

extension UIViewController {

    enum MyError: Error {
        case withMessage(String)
    }

    func addSwiftUIView<T: View>(_ swiftUIView: T, uiView: inout UIView!, completion: ((UIView)->Void)? = nil) throws {
        let vc = UIHostingController(rootView: swiftUIView)
        guard let uiViewFromSwiftUI = vc.view else {
            throw MyError.withMessage("Не обнаружена view у HostViewController")
        }
        uiView = uiViewFromSwiftUI
        uiView.translatesAutoresizingMaskIntoConstraints = false
        addChild(vc)
        view.addSubview(uiView)
        completion?(uiView)
        vc.didMove(toParent: self)
    }

    func addSwiftUIView<T: View>(swiftUIView: T, uiView: inout UIView!) -> Bool {
        do {
            try addSwiftUIView(swiftUIView, uiView: &uiView)
            return true
        } catch {
            return false
        }
    }
}
