//
//  ProductDetailViewController.swift
//  ECommerce
//
//  Created by Rumeysa Yücel on 22.02.2022.
//

import UIKit

class ProductDetailViewController: UIViewController {
    // MARK: - UI Elements
    @IBOutlet weak var productimageView: UIImageView!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var bagCountLabel: UILabel!
    @IBOutlet private weak var removeButton: UIButton!
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var addToCartButton: UIButton!
    @IBOutlet weak var heartButton: UIButton!
    
    // MARK: - Properties
    var results: Product!
    var totalOrder: Int = 1 {
      didSet {
        if viewIfLoaded != nil {
          bagCountLabel.text = "\(totalOrder)"
            bagCountLabel.text = String(totalOrder)
            
        }
      }
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateUI()
    }
    
    // MARK: - Functions
    func populateUI() {
        guard let results = results else { return }
        
        navigationItem.title = results.name.uppercased()
        priceLabel.text = String(results.price) + " $"
        categoryLabel.text = "Category: " + results.category
        colorLabel.text = "Color: " + results.color
        productimageView.image = UIImage(named: results.imageName)
        totalOrder = 1
        
        productimageView.makeCircularImageView()
     }
    

    // MARK: - IBActions
    @IBAction func heartButtonTapped(_ sender: UIButton) {
        heartButton.favButtonPressed()
    }
    
    @IBAction private func addButtonPressed() {
      totalOrder += 1
    }
    
    @IBAction private func removeButtonPressed() {
      guard totalOrder > 1 else { return }
      
      totalOrder -= 1
    }
    @IBAction func addToBagButtonTapped(_ sender: UIButton) {
        ShoppingCart.shared.addProduct(results, withCount: totalOrder)
        
    }
    

}
