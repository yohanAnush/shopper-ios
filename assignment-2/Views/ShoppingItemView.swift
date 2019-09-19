//
//  ItemCell.swift
//  assignment-2
//
//  Created by Anushka Liyanage on 9/18/19.
//  Copyright © 2019 Anushka Liyanage. All rights reserved.
//

import UIKit

/**
 * Represent a table view cell that can be used in a UITableView.
 * UI elements are referenced from a custom NIB "ShoppingItem".
 */
class ShoppingItemView: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemMiniDescription: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
}
