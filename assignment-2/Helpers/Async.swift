//
//  Async.swift
//  assignment-2
//
//  Created by Anushka Liyanage on 9/18/19.
//  Copyright © 2019 Anushka Liyanage. All rights reserved.
//

import UIKit

extension UIImageView {
    // Download from URL.
    func download(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
    
    // Override same function to support urls provided as strings instead of URL objects.
    func download(from url: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let urlObject = URL(string: url) else { return }
        download(from: urlObject)
    }
}
