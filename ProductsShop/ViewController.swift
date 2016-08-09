//
//  ViewController.swift
//  ProductsShop
//
//  Created by Heng Zeng on 8/9/16.
//  Copyright © 2016 com.vera. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let products = ["Product 1", "Product 2", "Product 3", "Product 4", "Product 5", "Product 6", "Product 7", "Product 8"]
    
    @IBAction func orderProducts(_ sender: UIBarButtonItem) {
        if let indexes = tableView.indexPathsForSelectedRows {
            let selectedProducts = indexes.map({ (indexPath) -> String in
                return products[indexPath.row]
            })
            shareOrderedProducts(products: selectedProducts)
        }
    }
    
    func shareOrderedProducts(products: [String]) {
        print("selected products: \(products)")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        cell.textLabel?.text = products[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        cell.accessoryType = .checkmark
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        cell.accessoryType = .none
    }
}

