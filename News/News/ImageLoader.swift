//
//  ImageLoader.swift
//  News
//
//  Created by Rick Wolter on 10/24/18.
//  Copyright © 2018 RNWolter. All rights reserved.
//

import UIKit

class ImageLoader {
    static func fetchImage(from url: URL?, completion: @escaping (_ image: UIImage?) -> Void) {
        
        guard let url = url else { completion(nil); return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                NSLog("Unable to fetch data")
                completion(nil)
                return
            }
            
            guard let image = UIImage(data: data) else {
                NSLog("Unable to construct image")
                completion(nil)
                return
            }
            
            completion(image)
        }
        
        dataTask.resume()
    }
}
