//
//  ShoppingDetailViewController.swift
//  The Errand App
//
//  Created by Gideon Bedzrah on 19/02/2021.
//

import UIKit

class ShopsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var categoryDescription: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    let shops: [ListofShops] = Shopping.listOfShops

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    @IBAction func backbuttontapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
extension ShopsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell", for: indexPath) as! ShopsCell
        let shopIndex = shops[indexPath.row]
        cell.shopName.text = shopIndex.name
        cell.shopLocations.text = shopIndex.locations
        cell.shopItems.text = shopIndex.itemTypes
        cell.operatingTime.text = shopIndex.operatingTime
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toShoppingList", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
