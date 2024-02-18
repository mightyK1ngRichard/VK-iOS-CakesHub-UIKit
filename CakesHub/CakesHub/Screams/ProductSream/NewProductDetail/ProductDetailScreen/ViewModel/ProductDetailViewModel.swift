//
//  NewProductDetailViewModel.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 04.02.2024.
//

import Foundation
import Combine

protocol NewDetailScreenViewModelProtocol {
    func didTapLikeButton(isSelected: Bool, completion: CHMVoidBlock?)
    func didTapBuyButton()
}

final class ProductDetailViewModel: ViewModelProtocol, ObservableObject {

    @Published var currentProduct: NewProductDetailModel

    init(data: NewProductDetailModel) {
        self.currentProduct = data
    }
}

// MARK: Network

extension ProductDetailViewModel: NewDetailScreenViewModelProtocol {

    func didTapLikeButton(isSelected: Bool, completion: CHMVoidBlock?) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) { [weak self] in
            asyncMain {
                self?.currentProduct.isFavorite = true
                self?.currentProduct.description = "NEW TEXT"
                completion?()
            }
        }
    }
    
    func didTapBuyButton() {}
}
