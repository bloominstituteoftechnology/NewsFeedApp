//
//  SettingsViewController.swift
//  NewsFeed
//
//  Created by Jerrick Warren on 10/28/18.
//  Copyright © 2018 Jerrick Warren. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
    }
    
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    @IBOutlet weak var postCountSegmentBar: UISegmentedControl!
    
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    let categories = ["General", "Health", "Business", "Sports", "Technology"]
    
    // set up the pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    
}
