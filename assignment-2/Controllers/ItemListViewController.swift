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
class ItemListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var selectedItem: Item?
    let api: API = API()
    
    var filteredItems: Array<Item> = []
    var items = [
        Item(id: 0, name: "Apple iPhone 6s", price: "300", thumbnailUrl: "", description: "", miniDescription: ""),
        Item(id: 1, name: "Apple iPhone 7s", price: "400", thumbnailUrl: "", description: "", miniDescription: ""),
        Item(id: 2, name: "Apple iPhone 8", price: "599",
             thumbnailUrl: "https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-8-new.jpg",
             description: "Internet Browser, Near Field Communication, Touchscreen, 3G Data Capable, 4G Data Capable, 4K Video Recording, Accelerometer, Bluetooth Enabled, Fingerprint Sensor, Global Ready, GPS, Music Player, Speakerphone, Water-Resistant, Wi-Fi Capable",
             miniDescription: "Geniune Apple product, mint condition")
    ]
    
    // Potential row count based on our data set.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredItems.count
    }
    
    // Populate the table.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingItem", for: indexPath) as! ShoppingItemView
        let item = filteredItems[indexPath.row]
        
        cell.itemName?.text = item.name
        cell.itemPrice?.text = item.price
        cell.itemMiniDescription?.text = item.miniDescription
        cell.thumbnail.download(from: item.thumbnailUrl)

        return cell
    }
    
    // Handle row selection.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedItem = items[indexPath.row]
        
        // Move to individual item screen.
        // Item object of the selected item is sent to next screen via the segue.
        // See "prepare" function.
        self.performSegue(withIdentifier: "listToIndividualSegue", sender: self)
    }
    
    
    // Send the item object from this screen to next screen via the segue.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "listToIndividualSegue") {
            let svc = segue.destination as! IndividualItemViewController
            svc.item = self.selectedItem
        }
    }
    
    // Search.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredItems = searchText.isEmpty ?
            items :
            items.filter { $0.name.range(of: searchText, options: .caseInsensitive) != nil }
        
        // If the search item is know present in already loaded item list,
        // get it from the backend.	
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the NIB.
        // Since the table is within another view, datasource and delegate must be handled from here.
        tableView.register(UINib(nibName: "ShoppingItem", bundle: nil), forCellReuseIdentifier: "ShoppingItem")
        tableView.dataSource = self
        tableView.delegate = self
        
        retrieveItems()
        
        // Search within the table by default.
        // Show everything when no input is made.
        searchBar.delegate = self
        filteredItems = items
        
    }
    
    func retrieveItems() {
        let requestUrl = URL(string: "\(api.APIEndPointItemsURL)/)")!
        
        // Get user's details.
        let task = URLSession.shared.dataTask(with: requestUrl) { (data, response, error) in
            if let error = error {
                print(error)
            }
            else if let data = data {
                let itemsArray = object(fromData: data) as! NSArray
                var temp: Array<Item> = []
                
                for item_ in itemsArray {
                    let item = item_ as! NSDictionary
                    temp.append(
                        Item(
                            id: item.object(forKey: "id") as! Int,
                            name: item.object(forKey: "name") as! String,
                            price: item.object(forKey: "price") as! String,
                            thumbnailUrl: item.object(forKey: "imageAsUrl") as! String,
                            description: item.object(forKey: "description") as! String,
                            miniDescription: ""
                        )
                    )
                }
                
                self.items = temp
                print(self.items)
            }
    }
}
}
