
//  UserDefaults.swift
//  NewsFeed
//
//  Created by Jerrick Warren on 10/25/18.
//  Copyright © 2018 Jerrick Warren. All rights reserved.


import Foundation

extension UserDefaults {
    static let postCountKey = "postCount"
    static let category = "category"
   // static let sny = "agnt"
    
    
   static var postCount:Int {
        get {
            let result = UserDefaults.standard.integer(forKey: postCountKey)
            return result == 0 ? 20 : result
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: postCountKey)
    }
    
    
}
}
