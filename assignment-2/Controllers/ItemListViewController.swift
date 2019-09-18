//
//  ItemListViewController.swift
//  assignment-2
//
//  Created by Anushka Liyanage on 9/18/19.
//  Copyright © 2019 Anushka Liyanage. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let items = [
        Item(id: 0, name: "Apple iPhone 6s", price: "300", thumbnailUrl: ""),
        Item(id: 1, name: "Apple iPhone 7s", price: "400", thumbnailUrl: ""),
        Item(id: 2, name: "Apple iPhone 8", price: "599", thumbnailUrl: ""),
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemView", for: indexPath) as! ItemCell
        let item = items[indexPath.row]
        cell.itemName?.text = item.name
        cell.itemPrice?.text = item.price
        
        print("Cell fired")
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ItemView", bundle: nil), forCellReuseIdentifier: "ItemView")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    
}
