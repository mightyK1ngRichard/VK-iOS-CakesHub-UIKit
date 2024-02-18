//
//  MainViewModel.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 05.02.2024.
//  Copyright 2024 © VK Team CakesHub. All rights reserved.
//

import SwiftUI
import CHMUIKIT

// MARK: - MainViewModelProtocol

protocol MainViewModelProtocol: AnyObject {
    func fetchData(completion: @escaping () -> Void)
    func startViewDidLoad()
    func pullToRefresh(completion: CHMVoidBlock?)
}

// MARK: - MainViewModel

final class MainViewModel: ViewModelProtocol {

    var sections: [Section] = []

    init() {
        self.sections.reserveCapacity(3)
    }
}

// MARK: - Section

extension MainViewModel {

    enum Section {
        case banner(CHMBigBannerView.Configuration)
        case news([CHMMainProductCard.Configuration])
        case sales([CHMMainProductCard.Configuration])
        case all([CHMMainProductCard.Configuration])
    }
}

extension MainViewModel.Section {

    var itemsCount: Int {
        switch self {
        case .banner: return 1
        case let .news(items): return items.count
        case let .sales(items): return items.count
        case let .all(items): return items.count
        }
    }
}

// MARK: - Actions

extension MainViewModel: MainViewModelProtocol {

    func startViewDidLoad() {
        sections.insert(.banner(.clear), at: 0)
        sections.insert(.sales([]), at: 1)
        sections.insert(.news([]), at: 2)
        sections.insert(.all([]), at: 3)
    }

    func fetchData(completion: @escaping () -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.2) {
            self.sections[0] = .banner(.clear)
            self.sections[1] = .sales(.mockSalesData)
            self.sections[2] = .news(.mockNewsData)
            self.sections[3] = .all(.mockAllData)
            asyncMain {
                completion()
            }
        }
    }

    func pullToRefresh(completion: CHMVoidBlock? = nil) {
        completion?()
    }
}
