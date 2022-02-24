//
//  Extension.swift
//  ECommerce
//
//  Created by Rumeysa Yücel on 23.02.2022.
//

import Foundation
import UIKit

extension UIImageView {
    func makeCircularImageView() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}
