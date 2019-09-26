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
        // performSegue(withIdentifier: "userLoginSuccessSegue", sender: self)
        performSegue(withIdentifier: "sellerLoginSuccessSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

