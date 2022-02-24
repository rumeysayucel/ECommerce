//
//  BagTableViewCell.swift
//  ECommerce
//
//  Created by Rumeysa Yücel on 23.02.2022.
//

import UIKit

class BagTableViewCell: UITableViewCell {
    // MARK: - UI Elements
    @IBOutlet weak var bagProductimageView: UIImageView!
    @IBOutlet weak var bagNameLabel: UILabel!
    @IBOutlet weak var bagPriceLabel: UILabel!
    @IBOutlet private weak var bagCountLabel: UILabel!
    
    // MARK: - Properties
    var results: Product!

    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK: - Functions
    func bagConfigure(with cartItem: CartItem) {
        bagProductimageView.image = UIImage(named: cartItem.product.imageName)
        bagProductimageView.makeCircularImageView()
        bagNameLabel.text = cartItem.product.name
        bagCountLabel.text = String(cartItem.count) + " items"
        bagPriceLabel.text = String(cartItem.totalPrice) + " $"
    }
    
    // MARK: - IBActions

}
