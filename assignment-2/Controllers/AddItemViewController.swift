//
//  AddItemViewController.swift
//  assignment-2
//
//  Created by Anushka Liyanage on 9/25/19.
//  Copyright © 2019 Anushka Liyanage. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    var imagePicker = UIImagePickerController()
    
    // Browse images from Photos/Camera.
    @IBAction func onAddImages(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
    // Send to backend.
    @IBAction func onAddItem(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }
}


extension AddItemViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
 
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            print("\(info)")
        }
    }
}
