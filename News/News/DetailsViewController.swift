//
//  DetailsViewController.swift
//  News
//
//  Created by Yvette Zhukovsky on 10/25/18.
//  Copyright © 2018 Yvette Zhukovsky. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    var info:NewsEntry?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let news = info else {return}
        headline.text = news.title
        content.text = news.content
        
        
        
    }
    
    
    
    @IBAction func doneButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBOutlet weak var headline: UILabel!
    
    @IBOutlet weak var content: UITextView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
