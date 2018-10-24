//
//  DetailVC.swift
//  News
//
//  Created by Nikita Thomas on 10/24/18.
//  Copyright © 2018 Nikita Thomas. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    var record: NewsEntry?
    
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var author: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let record = record else {return}
        headline.text = record.title
        content.text = record.content
        
        if let author = record.author {
            self.author.text = "Written By: \(author)"
        } else {
            self.author.text = ""
        }
        
        
        if let source = record.source {
            if let sourceName = source["name"] {
                self.source.text = "From: \(sourceName!)"
            } else {
                self.source.text = ""
            }
            
        }
    }
}
