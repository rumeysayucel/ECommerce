//
//  OrderConfirmViewController.swift
//  ECommerce
//
//  Created by Rumeysa Yücel on 22.02.2022.
//

import UIKit

class OrderConfirmViewController: UIViewController {

    // MARK: - UI Elements
    @IBOutlet weak var confirmPriceLabel: UILabel!
    
    // MARK: - Properties
    var results: Product!
    var cartItems: [CartItem] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmPriceLabel.text = "Total Payment: " + String(ShoppingCart.shared.getTotalCost()) + " $"

    }
    
    // MARK: - Functions

    // MARK: - IBActions
    @IBAction func ConfirmButtonTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }

}
