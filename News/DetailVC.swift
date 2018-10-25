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
        
        let darkMode = UserDefaults.standard.bool(forKey: "darkMode")
        if darkMode {
            view.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
            content.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
            author.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            content.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            source.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            headline.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        } else {
            view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            content.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            author.textColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
            content.textColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
            source.textColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
            headline.textColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
        }
    }
}
