//
//  AddItemViewController.swift
//  assignment-2
//
//  Created by Anushka Liyanage on 9/25/19.
//  Copyright © 2019 Anushka Liyanage. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var caption: UITextField!
    @IBOutlet weak var disc: UITextView!
    
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var imageThree: UIImageView!
    
    var imagePicker = UIImagePickerController()
    var selectedImageSlot: Int = 1  // Since there are three images.
    
    // Send to backend.
    @IBAction func onAddItem(_ sender: Any) {
    }
    
    // Browser images: Triggers.
    @IBAction func browseImageOne(_ sender: Any) {
        presentImagePicker()
        selectedImageSlot = 1
    }
    @IBAction func browseImageTwo(_ sender: Any) {
        presentImagePicker()
        selectedImageSlot = 2
    }
    @IBAction func browseImageThree(_ sender: Any) {
        presentImagePicker()
        selectedImageSlot = 3
    }
    // Browse images: Handler.
    func presentImagePicker() {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
    // Handle image assignment.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }
    
}


extension AddItemViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
 
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // Load image to relevant slot.
            switch selectedImageSlot {
            case 1:
                imageOne.image = image
                dismiss(animated: true, completion: nil)
                break
            case 2:
                imageTwo.image = image
                dismiss(animated: true, completion: nil)
                break
            case 3:
                imageThree.image = image
                dismiss(animated: true, completion: nil)
                break
            default:
                dismiss(animated: true, completion: nil)
                break
            }
        }
    }
}
