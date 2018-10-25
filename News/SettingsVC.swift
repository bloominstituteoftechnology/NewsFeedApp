//
//  Settings.swift
//  News
//
//  Created by Nikita Thomas on 10/24/18.
//  Copyright © 2018 Nikita Thomas. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var segmentedOutlet: UISegmentedControl!
    @IBAction func segmentedControl(_ sender: Any) {
        switch segmentedOutlet.selectedSegmentIndex {
        case 0:
            UserDefaults.standard.set(0, forKey: "numberOfArticles")
        case 1:
            UserDefaults.standard.set(1, forKey: "numberOfArticles")
        case 2:
            UserDefaults.standard.set(2, forKey: "numberOfArticles")
        case 3:
            UserDefaults.standard.set(3, forKey: "numberOfArticles")
        default:
            UserDefaults.standard.set(0, forKey: "numberOfArticles")
        }
        
    }
    @IBAction func darkModeSwitchClicked(_ sender: Any) {
        darkModeSwitch()
    }
    
    @IBAction func surpriseModeSwitchClicked(_ sender: Any) {
        surpriseSwitch()
    }
    
    @IBOutlet weak var lightSwitchOutlet: UISwitch!
    @IBOutlet weak var surpriseModeOutlet: UISwitch!
    
    
    func surpriseSwitch() {
        if surpriseModeOutlet.isOn {
            UserDefaults.standard.set(true, forKey: "surpriseMode")
        } else {
            UserDefaults.standard.set(false, forKey: "surpriseMode")
        }
    }
    
    func darkModeSwitch() {
        if lightSwitchOutlet.isOn {
            UserDefaults.standard.set(true, forKey: "darkMode")
        } else {
            UserDefaults.standard.set(false, forKey: "darkMode")
        }
    }
    
    
    @IBAction func doneButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateView() {
        let surpriseMode = UserDefaults.standard.bool(forKey: "surpriseMode")
        let darkMode = UserDefaults.standard.bool(forKey: "darkMode")
        let segmentedControl = UserDefaults.standard.integer(forKey: "numberOfArticles")
        
        segmentedOutlet.selectedSegmentIndex = segmentedControl
        lightSwitchOutlet.isOn = darkMode
        surpriseModeOutlet.isOn = surpriseMode
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
    
    
}

