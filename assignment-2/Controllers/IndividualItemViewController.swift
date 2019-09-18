//
//  IndividualItemViewController.swift
//  assignment-2
//
//  Created by Anushka Liyanage on 9/18/19.
//  Copyright © 2019 Anushka Liyanage. All rights reserved.
//

import UIKit

class IndividualItemViewController: UIViewController {
    var item: Item? = nil
    
    @IBOutlet weak var navbar: UINavigationBar!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var buy: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update the page with item details.
        if let item = item {
            navbar.topItem?.title = item.name
            itemName.text? = item.name
            itemDescription.text? = item.description
            image.download(from: item.thumbnailUrl)
            buy.setTitle("Add to cart for $\(item.price)", for: .normal)
        }
        
    }
}
