//
//  CartItem.swift
//  ECommerce
//
//  Created by Rumeysa Yücel on 23.02.2022.
//

import Foundation

struct CartItem {
    
  let product: Product
  let count: Int
  let totalPrice: Float
  
  init(product: Product, count: Int) {
    self.product = product
    self.count = count
    self.totalPrice = Float(count) * Float(product.price)
  }
}
