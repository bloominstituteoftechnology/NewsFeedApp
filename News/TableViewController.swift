//
//  ViewController.swift
//  News
//
//  Created by Nikita Thomas on 10/24/18.
//  Copyright © 2018 Nikita Thomas. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let reuseIdentifier = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
        
        
    }
    
    func checkUserSettings() {
        let darkMode = UserDefaults.standard.bool(forKey: "darkMode")
        let surpriseMode = UserDefaults.standard.bool(forKey: "surpriseMode")
        let numberOfArticles = UserDefaults.standard.integer(forKey: "numberOfArticles")
        
        if darkMode {
            
        }
        
        if surpriseMode {
            
        }
        
        switch numberOfArticles {
        case 10:
        case 20:
        case 50:
        case 100:
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Model.shared.fetch {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.records.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TableViewCell
        
        let record = Model.shared.records[indexPath.row]
        cell.titleLabel.text = record.title
        // cell.descriptionLabel.text = record.description
        // cell.textView.text = record.content
        
        ImageLoader.fetchImage(from: record.urlToImage) { image in
            guard let image = image else {return}
            DispatchQueue.main.async {
                cell.contentImageView.image = image
            }
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailVC else {return}
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        destination.record = Model.shared.records[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetailVC", sender: tableView)
    }


}

