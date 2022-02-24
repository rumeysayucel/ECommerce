//
//  ShoppingBagViewController.swift
//  ECommerce
//
//  Created by Rumeysa Yücel on 22.02.2022.
//

import UIKit

class ShoppingBagViewController: UIViewController {
    // MARK: - UI Elements
    @IBOutlet weak var bagTableView: UITableView!
    @IBOutlet weak var bagTotalPriceLabel: UILabel!

    
    // MARK: - Properties
    var bagProducts = [Product]()
    var bags: Product!
    
    var cartItems: [CartItem] = []
    var totalPrice: Float = 0 {
      didSet {
        if viewIfLoaded != nil {
            bagTotalPriceLabel.text = String(totalPrice) + " $"
        }
      }
    }
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        bagTableView.delegate = self
        bagTableView.dataSource = self
    
        loadData()
        
    }
    
    // MARK: - Functions
    private func loadData() {
      cartItems = ShoppingCart.shared.getCartItems()
      totalPrice = ShoppingCart.shared.getTotalCost()
    }
    private func removeCartItem(at row: Int) {
      guard row < cartItems.count else { return }
      
      ShoppingCart.shared.removeProduct(cartItems[row].product)
      
      loadData()
    }


    // MARK: - IBActions

}

// MARK: - Extensions
extension ShoppingBagViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
      return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        removeCartItem(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
      }
    }
}
extension ShoppingBagViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "bagCell", for: indexPath) as? BagTableViewCell{
        cell.bagConfigure(with: cartItems[indexPath.row])
        return cell
        }
        return UITableViewCell()
    }
    
    
}
