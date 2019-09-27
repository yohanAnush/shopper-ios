//
//  ViewController.swift
//  assignment-2
//
//  Created by Anushka Liyanage on 9/14/19.
//  Copyright © 2019 Anushka Liyanage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let api: API = API()

    @IBOutlet weak var userSelectionOnLoginScreen: UISegmentedControl!
    @IBOutlet weak var userSelectionOnRegScreen: UISegmentedControl!
    
    // Login page.
    @IBOutlet weak var emailOnLogin: UITextField!
    @IBOutlet weak var passwordOnLogin: UITextField!
    
    // Reg page.
    @IBOutlet weak var emailOnReg: UITextField!
    @IBOutlet weak var passwordOnReg: UITextField!
    
    
    @IBAction func doLogin(_ sender: Any) {
        let email = emailOnLogin.text!
        let password = passwordOnLogin.text!
        
        let requestUrl = URL(string: "https://5d8cbac1443e3400143b4a78.mockapi.io/users/\(email)")!
        var passwordCorrect = false
        var complete = false
        
        // Get user's details.
        let task = URLSession.shared.dataTask(with: requestUrl) { (data, response, error) in
            if let error = error {
                print(error)
            }
            else if let data = data {
                let user = object(fromData: data) as! NSDictionary
                let passwordInServer = user.object(forKey: "password") as! String
                
                // Logging in.
                if (password == passwordInServer) {
                    passwordCorrect = true
                }
                complete = true
            }
        }
        task.resume()
        
        while(!complete) {
            // Show loading screen.
           
        }
        
        if (passwordCorrect) {
            switch self.userSelectionOnLoginScreen.selectedSegmentIndex {
            case 0:
                self.performSegue(withIdentifier: "userLoginSuccessSegue", sender: self)
                break
            case 1:
                self.performSegue(withIdentifier: "sellerLoginSuccessSegue", sender: self)
                break
            default:
                break
            }
        }
        // performSegue(withIdentifier: "userLoginSuccessSegue", sender: self)
        // performSegue(withIdentifier: "sellerLoginSuccessSegue", sender: self)
    }
    
    @IBAction func doRegister(_ sender: Any) {
        let email = emailOnReg.text!
        let password = passwordOnReg.text!
        
        let body: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        let jsonBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        let requestUrl = URL(string: "https://5d8cbac1443e3400143b4a78.mockapi.io/users/")!
        var request = URLRequest(url: requestUrl)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = jsonBody
        
        var complete = false
        var success = false
        
        // Get user's details.
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
            }
            else if let data = data {
                if let httpResponse = response as? HTTPURLResponse {
                    let statusCode = httpResponse.statusCode
                    success = (statusCode == 200 || statusCode == 201)
                }
                complete = true
            }
        }
        task.resume()
        
        while(!complete) {
            // Show loading screen.
            
        }
        
        if (success) {
            self.performSegue(withIdentifier: "backToLoginPage", sender: self)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

