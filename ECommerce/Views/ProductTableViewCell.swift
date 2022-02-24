//
//  ProductDetailTableViewCell.swift
//  ECommerce
//
//  Created by Rumeysa Yücel on 22.02.2022.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    // MARK: - UI Elements
    @IBOutlet weak var productimageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addToBagButton: UIButton!
    
    // MARK: - Properties
    var results: Product!

    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        productimageView.makeCircularImageView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Functions
    func configure(with product: Product) {
        productimageView.image = UIImage(named: product.imageName)
        nameLabel.text = product.name
        priceLabel.text = String(product.price) + " $"
    }
    
    // MARK: - IBActions    
    @IBAction func addToBagButtonTapped(_ sender: UIButton) {
        ShoppingCart.shared.addProduct(results, withCount: 1)
    }
    
}
