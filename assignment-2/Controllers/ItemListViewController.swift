//
//  ItemListViewController.swift
//  assignment-2
//
//  Created by Anushka Liyanage on 9/18/19.
//  Copyright © 2019 Anushka Liyanage. All rights reserved.
//

import UIKit

/**
 * Responsible for populating shopping items table with data.
 * A custom NIB is used to represent a table cell.
 */
class ItemListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let items = [
        Item(id: 0, name: "Apple iPhone 6s", price: "300", thumbnailUrl: ""),
        Item(id: 1, name: "Apple iPhone 7s", price: "400", thumbnailUrl: ""),
        Item(id: 2, name: "Apple iPhone 8", price: "599", thumbnailUrl: ""),
    ]
    
    // Potential row count based on our data set.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // Populate the table.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingItem", for: indexPath) as! ShoppingItemView
        let item = items[indexPath.row]
        
        cell.itemName?.text = item.name
        cell.itemPrice?.text = item.price

        return cell
    }
    
    // Handle row selection.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemSelected = items[indexPath.row]
        
        // Move to individual item screen.
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the NIB.
        // Since the table is within another view, datasource and delegate must be handled from here.
        tableView.register(UINib(nibName: "ShoppingItem", bundle: nil), forCellReuseIdentifier: "ShoppingItem")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    
}
