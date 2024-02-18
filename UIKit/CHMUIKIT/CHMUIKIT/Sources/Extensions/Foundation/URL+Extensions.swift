//
//  URL+Extensions.swift
//  CakeHubApplication
//
//  Created by Дмитрий Пермяков on 04.10.2023.
//

import Foundation

public extension URL {

    static let mockLoadingUrl = URL(string: "https://w.forfun.com/fetch/16/16a534a456a291314abc8f4879abdffd.jpeg")
    static let mockProductCard = URL(string: "https://www.seoclerk.com/pics/208681-1cDOq21397908233.jpg")
    static let mockCake1 = URL(string: "https://cdn.culture.ru/images/180e71d7-ad14-5568-8903-3fc2b9df4418")
    static let mockCake2 = URL(string: "https://almode.ru/uploads/posts/2021-12/1640586595_8-almode-ru-p-tort-prazdnichnii-s-ukrasheniem-9.jpg")
    static let mockCake3 = URL(string: "https://almode.ru/uploads/posts/2021-12/1640552550_12-almode-ru-p-krasivie-torti-12.jpg")
    static let mockCake4 = URL(string: "https://mykaleidoscope.ru/uploads/posts/2021-09/1632834133_8-mykaleidoscope-ru-p-dekor-dvukhyarusnogo-torta-krasivo-foto-9.jpg")
    static let invalidUrl = URL(string: "invalid://url")
}
