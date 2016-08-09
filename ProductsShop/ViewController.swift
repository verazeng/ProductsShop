//
//  ViewController.swift
//  ProductsShop
//
//  Created by Heng Zeng on 8/9/16.
//  Copyright © 2016 com.vera. All rights reserved.
//

import UIKit

enum ShareDataOption : Int {
    case AppGroup = 0, URLSchemeAndPasteboard, Airdrop
    
    static let allValues = [AppGroup, URLSchemeAndPasteboard, Airdrop]
    
    var title : String {
        switch self {
        case .AppGroup:
            return "AppGroup"
        case .URLSchemeAndPasteboard:
            return "URLSchemeAndPasteboard"
        case .Airdrop:
            return "AirDrop"
        }
    }
}

class ViewController: UITableViewController {

    let products = ["Product 1", "Product 2", "Product 3", "Product 4", "Product 5", "Product 6", "Product 7", "Product 8"]
    var dataShareOption : ShareDataOption = .AppGroup
    
    @IBOutlet weak var optionPicker: UIPickerView!
    
    @IBAction func orderProducts(_ sender: UIBarButtonItem) {
        if let indexes = tableView.indexPathsForSelectedRows {
            let selectedProducts = indexes.map({ (indexPath) -> String in
                return products[indexPath.row]
            })
            shareOrderedProducts(products: selectedProducts)
        }
    }
    
    @IBAction func selectDataShareOptions(_ sender: UIBarButtonItem) {
        optionPicker.isHidden = false
    }
    
    func shareOrderedProducts(products: [String]) {
        print("selected products: \(products)")
        print("share option: \(dataShareOption.title)")
    }
    
}

extension ViewController {
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
        optionPicker.isHidden = true
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        cell.accessoryType = .none
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ShareDataOption.allValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ShareDataOption(rawValue: row)!.title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dataShareOption = ShareDataOption(rawValue: row)!
    }
}
