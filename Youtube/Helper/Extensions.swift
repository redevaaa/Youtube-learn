//
//  Extensions.swift
//  Youtube
//
//  Created by redevaaa on 2020/12/12.
//

import Foundation
import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIImageView {
    
    func loadImageUsingUrlString(_ urlString: String) {
        image = nil
        
        let session = URLSession(configuration: .default)
        if let url = URL(string: urlString) {
            let task = session.dataTask(with: url) { (data: Data?, response, error) in
                if error != nil { print(error!); return }
                DispatchQueue.main.async {
                    self.image = UIImage(data: data!)
                }
            }
            task.resume()
        }
    }
    
}
