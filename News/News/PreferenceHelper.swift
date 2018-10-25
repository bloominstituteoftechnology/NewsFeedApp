//
//  PreferenceHelper.swift
//  News
//
//  Created by Rick Wolter on 10/24/18.
//  Copyright © 2018 RNWolter. All rights reserved.
//

import Foundation

class PreferenceHelper {
    
    
    let themePreferenceKey = "themePreferenceKey"
    let numberOfArticlesPreferenceKey = "numberOfArticlesPreferenceKey"
    let defaults = UserDefaults.standard
    
    var themePreference: String? {
        return defaults.string(forKey: themePreferenceKey)
    }
    
    init(){
        if themePreference == nil {setThemePreferenceToLight()}
    }
    
    func savePreference(){
    
        let numberOfArticlesPreference = 10
        UserDefaults.standard.setValue(numberOfArticlesPreference, forKey: numberOfArticlesPreferenceKey)
    }
    
    func setThemePreferenceToDark() {
        
        defaults.set("dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLight(){
        
        defaults.set("light", forKey: themePreferenceKey)
    }
}
