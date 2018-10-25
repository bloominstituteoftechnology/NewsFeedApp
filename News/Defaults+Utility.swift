//
//  Defaults+Utility.swift
//  News
//
//  Created by Nikita Thomas on 10/25/18.
//  Copyright © 2018 Nikita Thomas. All rights reserved.
//

import Foundation

extension UserDefaults {
    static let postCountKey = "postCount"
    
    static var postCount: Int {
        get {
            let result = UserDefaults.standard.integer(forKey: postCountKey)
            return result == 0 ? 20 : result
        } set(newValue) {
            UserDefaults.standard.set(newValue, forKey: postCountKey)
        }
    }
}
