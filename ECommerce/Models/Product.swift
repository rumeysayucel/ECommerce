//
//  Product.swift
//  ECommerce
//
//  Created by Rumeysa Yücel on 22.02.2022.
//

import Foundation

// MARK: - Welcome
struct Results: Decodable {
    let products: [Product]
    let totalProductCount: Int
    let filterOptions: [FilterOption]
    let sortOptions: [SortOption]

    enum CodingKeys: String, CodingKey {
        case products
        case totalProductCount = "total_product_count"
        case filterOptions = "filter_options"
        case sortOptions = "sort_options"
    }
}

// MARK: - FilterOption
struct FilterOption: Codable {
    let name: String
    let values: [String]
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let price: Double
    let name: String
    let category: String
    let currency: String
    let imageName: String
    let color: String

    enum CodingKeys: String, CodingKey {
        case id, price, name, category, currency
        case imageName = "image_name"
        case color
    }
}

//enum Category: String, Codable {
//    case coat = "Coat"
//    case dress = "Dress"
//    case sweater = "Sweater"
//}

//enum Color: String, Codable {
//    case black = "Black"
//    case blue = "Blue"
//    case white = "White"
//}
//
//enum Currency: String, Codable {
//    case usd = "USD"
//}

extension Product: Hashable {
  var hashValue: Int {
    return name.hashValue
  }
}

extension Product: Equatable {
  static func == (lhs: Product, rhs: Product) -> Bool {
    return (lhs.name == rhs.name &&
      lhs.imageName == rhs.imageName &&
      lhs.price == rhs.price)
  }
}

// MARK: - SortOption
struct SortOption: Codable {
    let id, name: String
}

