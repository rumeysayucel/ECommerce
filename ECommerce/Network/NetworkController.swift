//
//  NetworkController.swift
//  ECommerce
//
//  Created by Rumeysa Yücel on 22.02.2022.
//

import UIKit

class NetworkController {
    func fetchProductInfo(completion: @escaping (Product?) -> Void) {
        let baseUrl = URL(string: "https://www.momentup.co/challange/ProductsWithFilter.json")!

        let dataTask = URLSession.shared.dataTask(with: baseUrl) { (data, _, error) in
            let jsonDecoder = JSONDecoder()
            
            if let data = data, let productObject = try? jsonDecoder.decode(Product.self, from: data) {
                completion(productObject)
            }else {
                completion(nil)
            }
        }
    
        dataTask.resume()
    }
    
    func fetchProductPhoto(from url: URL, completion: @escaping (UIImage?) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            }else {
                completion(nil)
            }
        }
        
        dataTask.resume()
    }
}
