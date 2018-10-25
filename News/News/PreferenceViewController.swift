//
//  PreferenceViewController.swift
//  News
//
//  Created by Rick Wolter on 10/24/18.
//  Copyright © 2018 RNWolter. All rights reserved.
//

import UIKit

class PreferenceViewController: UIViewController {

    
    let preferenceHelper = PreferenceHelper()
    
    @IBOutlet weak var numberOfArticlesSegment: UISegmentedControl!
    @IBOutlet weak var themeSegment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func toggleNumberOfArticles(_ sender: Any) {
    }
    @IBAction func toggleThemeColor(_ sender: Any) {
        if themeSegment.selectedSegmentIndex == 0 {
            preferenceHelper.setThemePreferenceToLight()
        } else {
            PreferenceHelper.setThemePreferenceToDark()
        }
    }
}
