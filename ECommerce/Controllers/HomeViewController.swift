//
//  ViewController.swift
//  ECommerce
//
//  Created by Rumeysa Yücel on 22.02.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - UI Elements
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var products = [Product]()
    var results: Product!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let url = URL(string: "https://www.momentup.co/challange/ProductsWithFilter.json")!
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            if let data = data {
                do {
                    let results = try JSONDecoder().decode(Results.self, from: data)
                    DispatchQueue.main.async {
                        self.products = results.products
                        self.tableView.reloadData()
                    }
                }catch {
                    print(error)
                }
               
            }
        }.resume()
        
    }

    
    // MARK: - Functions

    
    
    // MARK: - IBActions
    
    
}

// MARK: - Extensions
extension HomeViewController: UITableViewDelegate {
    
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 300
  }
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //tableView.deselectRow(at: indexPath, animated: true)
      performSegue(withIdentifier: "ListToDetail", sender: self)
  }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ListToDetail" {
            if let destinationVc = segue.destination as? ProductDetailViewController, let index = tableView.indexPathForSelectedRow {
                destinationVc.results = products[index.row]
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return products.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
      cell.configure(with: products[indexPath.row])
      cell.results = products[indexPath.row]
      return cell
  }
}


