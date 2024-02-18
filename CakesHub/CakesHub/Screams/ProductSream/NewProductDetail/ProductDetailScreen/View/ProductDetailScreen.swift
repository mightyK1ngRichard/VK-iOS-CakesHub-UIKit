//
//  ProductDetailScreen.swift
//  CakesHub
//
//  Created by Dmitriy Permyakov on 04.02.2024.
//

import SwiftUI
import CHMUIKIT

struct ProductDetailScreen: View {

    // MARK: View Model

    typealias ViewModel = ProductDetailViewModel
    @StateObject var viewModel: ViewModel

    // MARK: Properties

    @State private var topPadding: CGFloat = .zero
    @State private var selectedPicker: PickersSectionView.PickersItem?
    @State private var showSheetView = false
    @State private var isPressedLike: Bool

    init(viewModel: ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self._isPressedLike = State(initialValue: viewModel.currentProduct.isFavorite)
    }

    // MARK: View

    var body: some View {
        NavigationStack {
            MainBlock
                .background(Color.bgMainColor)
                .overlay(alignment: .bottom) {
                    BuyButton
                        .padding(.bottom, UIDevice.isSe ? 16 : .zero)
                }
                .overlay(alignment: .topLeading) {
                    NavigationTabBarView
                }
                .onChange(of: selectedPicker) { _, newValue in
                    showSheetView = newValue != nil
                }
                .blurredSheet(
                    .init(Color.bgMainColor),
                    show: $showSheetView) {
                        selectedPicker = nil
                    } content: {
                        SheetView
                        .presentationDetents([.height(368)])
                    }
        }
    }
}

// MARK: - Actions

private extension ProductDetailScreen {

    func didTapFavoriteIcon() {
        viewModel.currentProduct.isFavorite = false
        viewModel.didTapLikeButton(isSelected: isPressedLike) {
            isPressedLike = viewModel.currentProduct.isFavorite
        }
    }

    func didTapSimilarProductCard(id: UUID) {
        print("id: \(id)")
    }

    func didTapBuyButton() {
        viewModel.didTapBuyButton()
    }
}

// MARK: - Subviews

private extension ProductDetailScreen {

    var MainBlock: some View {
        ScrollView {
            VStack {
                ImagesBlock

                PickersBlock
                    .padding(.top, 22)

                DetailBlock

                MoreInfoBlock
                    .padding(.top, 20)

                SimilarProductsBlock
                    .padding(.top, 20)
            }
            .padding(.top, topPadding)
        }
        .scrollIndicators(.hidden)
    }

    @ViewBuilder
    var ImagesBlock: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 4) {
                    ForEach(viewModel.currentProduct.images) { image in
                        MKRImageView(
                            configuration: .basic(
                                kind: image.kind,
                                imageSize: CGSize(width: 275, height: 413),
                                imageShape: .rectangle
                            )
                        )
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }

    var PickersBlock: some View {
        PickersSectionView(
            pickers: viewModel.currentProduct.pickers.map { .init(title: $0) },
            lastSelected: $selectedPicker
        )
        .overlay(alignment: .trailing) {
            LikeIcon(isSelected: $isPressedLike) {
                didTapFavoriteIcon()
            }
                .padding(.trailing)
        }
    }

    var DetailBlock: some View {
        CHMProductDescriptionView(
            configuration: .basic(
                title: viewModel.currentProduct.productName,
                price: viewModel.currentProduct.price,
                subtitle: viewModel.currentProduct.sellerName,
                description: viewModel.currentProduct.description,
                starsConfiguration: .basic(
                    kind: .init(rawValue: viewModel.currentProduct.starsCount) ?? .zero,
                    feedbackCount: viewModel.currentProduct.reviewInfo.feedbackCounter
                )
            )
        )
    }

    var SimilarProductsBlock: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(String.similarBlockHeaderTitle)
                .font(.system(size: 18, weight: .semibold))
                .padding(.leading, 16)

            SimilarProductCards
                .padding(.bottom, 100)
        }
    }

    var MoreInfoBlock: some View {
        VStack {
            Divider()
            // FIXME: iOS-17: Применить корректный паттерн роутинга
            NavigationLink {
                ProductReviewsScreen(
                    viewModel: .init(data: viewModel.currentProduct.reviewInfo)
                )
            } label: {
                MoreInfoCell(text: .ratingReviewsCell)
                    .padding(.horizontal)
            }

            Divider()
            MoreInfoCell(text: .sellerInfoCell)
                .padding(.horizontal)
            Divider()
        }
    }

    func MoreInfoCell(text: String) -> some View {
        HStack {
            Text(text)
                .font(.system(size: 16, weight: .regular))
                .tint(Color.textPrimary)
            Spacer()
            Image("chevron.right")
                .renderingMode(.template)
                .tint(Color.textPrimary)
                .frame(width: 16, height: 16)
        }
        .frame(height: 48)
    }

    @ViewBuilder
    var SimilarProductCards: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 11) {
                ForEach(viewModel.currentProduct.similarProducts) { product in
                    CHMNewProductCard(configuration: product.configuration) {
                        didTapSimilarProductCard(id: product.id)
                    }
                }
            }
            .padding(.leading, 17)
        }
        .scrollIndicators(.hidden)
    }

    var NavigationTabBarView: some View {
        ZStack {
            Image("chevron")
                .renderingMode(.template)
                .tint(.textPrimary)
                .padding(.leading, 8)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(viewModel.currentProduct.productName)
                .font(.system(size: 18, weight: .semibold))
                .lineLimit(1)
                .tint(.textPrimary)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, 30)
        }
        .padding(.bottom, 8)
        .background(Color.bgMainColor)
        .getSize {
            topPadding = $0.height
        }
    }

    var BuyButton: some View {
        Button {
            didTapBuyButton()
        } label: {
            Text(String.buyButtonTitle)
                .font(.system(size: 14, weight: .medium))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(Color.bgRedLint)
        .clipShape(.rect(cornerRadius: 25))
        .padding(.horizontal)
        .tint(Color.white)
    }

    var SheetView: some View {
        VStack {
            if let selectedPicker {
                Text("\(selectedPicker.id)")
                Text("\(selectedPicker.title)")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .top) {
            RoundedRectangle(cornerRadius: 3)
                .fill(Color(hexLight: 0x9B9B9B, hexDarK: 0xABB4BD))
                .frame(width: 60, height: 6)
                .padding(.top, 14)
        }
    }
}

// MARK: - Inner Subviews

fileprivate struct PickersView: View {

    struct PickerTitle: Identifiable {
        let id = UUID()
        var title: String = .clear
    }

    var pickers: [PickerTitle] = []
    @State private var lastSelected: UUID? = nil

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(pickers) { picker in
                    CHMPicker(
                        configuration: .basic(picker.title),
                        handlerConfiguration: .init(didTapView: { isSelected in
                            if isSelected {
                                lastSelected = picker.id
                            }
                        }),
                        isSelected: .constant(picker.id == lastSelected)
                    )
                }
            }
            .padding(.vertical, 1)
            .padding(.leading)
        }
    }
}

// MARK: - Preview

#Preview {
    ProductDetailScreen(viewModel: .mockData)
}

// MARK: - Extenstions

private struct ViewPreferenceKey: PreferenceKey {
    typealias Value = CGSize
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

private extension View {

    func getSize(size: @escaping (CGSize) -> Void) -> some View {
        background {
            GeometryReader { proxy in
                Color.clear
                    .preference(key: ViewPreferenceKey.self, value: proxy.size)
            }
        }
        .onPreferenceChange(ViewPreferenceKey.self, perform: size)
    }
}

// MARK: - Constants

private extension String {

    static let similarBlockHeaderTitle = "You can also like this"
    static let ratingReviewsCell = "Rating&Reviews"
    static let sellerInfoCell = "Seller info"
    static let buyButtonTitle = "MAKE AN ORDER"
}
