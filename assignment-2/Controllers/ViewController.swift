//
//  ViewController.swift
//  assignment-2
//
//  Created by Anushka Liyanage on 9/14/19.
//  Copyright © 2019 Anushka Liyanage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTypeSelector: UISegmentedControl!
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    
    
    @IBAction func onRegisterBtnClick(_ sender: Any) {
        let registrationViewController: UIViewController = UIStoryboard(name: "Registration", bundle: nil).instantiateViewController(withIdentifier: "Registration") as UIViewController
        
        self.present(registrationViewController, animated: false, completion: nil)
    }
    
    @IBAction func onLoginBtnClick(_ sender: Any) {
        let email = loginEmail.text
        let password = loginPassword.text
        let userType = userTypeSelector.selectedSegmentIndex
        
        print("\(email)  \(password)  \(userType)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

