//
//  ShoppingCard.swift
//  ECommerce
//
//  Created by Rumeysa Yücel on 23.02.2022.
//

import Foundation
class ShoppingCart {
  
  static let shared = ShoppingCart()
  
  var products: [Product: Int] = [:]
  
  private init() {}
  
  func addProduct(_ product: Product, withCount count: Int) {
    if let currentCount = products[product] {
      products[product] = currentCount + count
    } else {
      products[product] = count
    }
  }

  func removeProduct(_ product: Product) {
    products[product] = nil
  }
  
  func getTotalCost() -> Float {
      return products.reduce(Float(0)) { $0 + (Float($1.key.price) * Float($1.value)) }
  }
  
  func getTotalCount() -> Int {
    return products.reduce(0) { $0 + $1.value }
  }
  
  func getCartItems() -> [CartItem] {
    return products.map { CartItem(product: $0.key, count: $0.value) }
  }
}
