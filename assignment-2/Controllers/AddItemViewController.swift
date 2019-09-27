//
//  AddItemViewController.swift
//  assignment-2
//
//  Created by Anushka Liyanage on 9/25/19.
//  Copyright © 2019 Anushka Liyanage. All rights reserved.
//

import Photos
import UIKit

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var disc: UITextView!
    
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var imageThree: UIImageView!
    
    
    var imagePicker = UIImagePickerController()
    var selectedImageSlot: Int = 1  // Since there are three images.
    let api: API = API()
    
    // Send to backend.
    @IBAction func onAddItem(_ sender: Any) {
        let aName = name.text!
        let aPrice = price.text!
        let aDescription = disc.text!
        
        let body: [String: Any] = [
            "id": "1",
            "name": aName,
            "description": aDescription,
            "price": aPrice
        ]
        let jsonBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        let requestUrl = URL(string: "http://localhost:3000/items/)")!
        var request = URLRequest(url: requestUrl)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = jsonBody
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
            }
            else if let data = data {
                print(String(data: data, encoding: .utf8))
            }
        }
        
        task.resume()
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
        checkPermission()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }
    
}


// Image picking and assignmnet.
extension AddItemViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
 
    @objc public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // Get location.
            let imageUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL
            print("img url:\(imageUrl)")
            let asset = PHAsset.fetchAssets(withALAssetURLs: [imageUrl!], options: nil)
            print("asset:\(asset.count)")
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
    
    public func checkPermission() {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAuthorizationStatus {
        case .authorized:
            print("Access is granted by user")
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({
                (newStatus) in
                print("status is \(newStatus)")
                if newStatus ==  PHAuthorizationStatus.authorized {
                    /* do stuff here */
                    print("success")
                }
            })
            print("It is not determined until now")
        case .restricted:
            // same same
            print("User do not have access to photo album.")
        case .denied:
            // same same
            print("User has denied the permission.")
        }
    }
}
