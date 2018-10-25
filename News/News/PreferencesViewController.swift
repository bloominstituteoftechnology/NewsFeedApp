//
//  PreferencesTableViewController.swift
//  News
//
//  Created by Yvette Zhukovsky on 10/24/18.
//  Copyright © 2018 Yvette Zhukovsky. All rights reserved.
//

import UIKit


class Preferences: Codable, Equatable{
    static func == (lhs: Preferences, rhs: Preferences) -> Bool {
       return lhs.index == rhs.index
      
    }

     var index:Int = 0
    var pageSize:Int  {
        if index == 0 { return 10 }
        if index == 1 { return 20 }
        if index == 2 { return 50 }
        if index == 3 { return 100 }
        return 0
    }
    
    var categoryIndex = 0
    var category:String? {
        if categoryIndex == 0 {return nil}
        if categoryIndex == 1 {return "business"}
        if categoryIndex == 2 {return "entertainment"}
        if categoryIndex == 3 {return "health"}
        return nil
    }
  
    
    
    var countryIndex = 0
    var country:String? {
        if countryIndex == 0 {return "us"}
        if countryIndex == 1 {return "ca"}
        if countryIndex == 2 {return "fr"}
        if countryIndex == 3 {return "ru"}
        return "us"
    }
    
    
    
    
    
    private init() {}
    static var shared = Preferences()
    
    static func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shared)
            try data.write(to: url)
        } catch {
            NSLog("Error saving shopping items: \(error)")
        }
    }
    
    static func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = persistentFileURL, fm.fileExists(atPath: url.path) else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shared = try decoder.decode(Preferences.self, from: data)
            
        } catch {
            NSLog("Error loading shopping items: \(error)")
        }
    }
    
    static private var persistentFileURL: URL? {
        let fm = FileManager.default
        guard let docsDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return docsDir.appendingPathComponent("news.plist")
    }
    
}




class PreferencesViewController: UIViewController {
   

    
    override func viewWillAppear(_ animated: Bool) {
        segController.selectedSegmentIndex = Preferences.shared.index
        categorySegment.selectedSegmentIndex = Preferences.shared.categoryIndex
        countrySeg.selectedSegmentIndex = Preferences.shared.countryIndex
    }
    
    
    
    
//    func getPageSize()-> Int {
//      if segController.selectedSegmentIndex == 0 { return 10 }
//      if segController.selectedSegmentIndex == 1 { return 20 }
//      if segController.selectedSegmentIndex == 2 { return 50 }
//      if segController.selectedSegmentIndex == 3 { return 100 }
//        return 10
//    }
//
 
    @IBOutlet weak var segController: UISegmentedControl!
  
    @IBAction func categorySeg(_ sender: Any) {
        Preferences.shared.categoryIndex = categorySegment.selectedSegmentIndex
        
        Preferences.saveToPersistentStore()
    
    }
    
  
    
    @IBOutlet weak var categorySegment: UISegmentedControl!
    
    
    @IBAction func segControl(_ sender: Any) {
       Preferences.shared.index = segController.selectedSegmentIndex
        
        Preferences.saveToPersistentStore()
    }
    
    
    @IBAction func segCountry(_ sender: Any) {
   Preferences.shared.countryIndex = countrySeg.selectedSegmentIndex
    Preferences.saveToPersistentStore()
        
    }
    
    
    
    @IBOutlet weak var countrySeg: UISegmentedControl!
    
}
    
    

