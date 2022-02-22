//
//  Product.swift
//  ECommerce
//
//  Created by Rumeysa Yücel on 22.02.2022.
//

import Foundation

// MARK: - Product
struct Product: Codable {
    let id: Int
    let price: Double
    let name: String
    let category: Category
    let currency: Currency
    let imageName: String
    let color: Color

    enum CodingKeys: String, CodingKey {
        case id, price, name, category, currency
        case imageName = "image_name"
        case color
    }
}

enum Category: String, Codable {
    case coat = "Coat"
    case dress = "Dress"
    case sweater = "Sweater"
}

enum Color: String, Codable {
    case black = "Black"
    case blue = "Blue"
    case white = "White"
}

enum Currency: String, Codable {
    case usd = "USD"
}
