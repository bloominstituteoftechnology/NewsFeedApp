//
//  ViewController.swift
//  News
//
//  Created by Yvette Zhukovsky on 10/24/18.
//  Copyright © 2018 Yvette Zhukovsky. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let reuseIdentifier = "newcell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
        Preferences.loadFromPersistentStore()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    Model.shared.fetch() {
            DispatchQueue.main.async { self.tableView.reloadData() }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.records.count
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toPVC", sender: tableView)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TableViewCell
        let record = Model.shared.records[indexPath.row]
        
        cell.titleLabel.text = record.title
        cell.descriptionLabel.text = record.description
        cell.textView.text = record.content
        
        ImageLoader.fetchImage(from: record.urlToImage){ image in
            
            guard let image = image else {return }
            DispatchQueue.main.async {
                cell.contentImageView.image = image
            }
        }
        
        
        
        return cell
    }


}


