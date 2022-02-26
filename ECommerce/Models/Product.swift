//
//  Product.swift
//  ECommerce
//
//  Created by Rumeysa Yücel on 22.02.2022.
//

import Foundation

// MARK: - Results
struct Results: Decodable {
    let products: [Product]
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
// MARK: - Product Extension
extension Product: Hashable {
  var hashValue: Int {
    return name.hashValue
  }
}
