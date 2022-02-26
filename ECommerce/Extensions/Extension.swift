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

extension UIButton {
    func favButtonPressed() {
        if self.tintColor == .black {
            self.tintColor = .red
            self.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }else {
            self.tintColor = .black
            self.setImage(UIImage(systemName: "heart"), for: .normal)
        }

    }
}
