//
//  ViewController.swift
//  assignment-2
//
//  Created by Anushka Liyanage on 9/14/19.
//  Copyright © 2019 Anushka Liyanage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func doLogin(_ sender: Any) {
        let itemsViewController = self.storyboard?.instantiateViewController(withIdentifier: "Items") as! ViewController
        self.present(itemsViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

