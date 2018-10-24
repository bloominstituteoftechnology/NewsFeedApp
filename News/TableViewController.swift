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
        let surpriseMode = UserDefaults.standard.bool(forKey: "surpriseMode")
        
        if surpriseMode {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
                fatalError("Surprise")
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkUserSettings()
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
        
        let darkMode = UserDefaults.standard.bool(forKey: "darkMode")
        DispatchQueue.main.async {
            if darkMode {
                cell.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
                cell.contentView.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
                tableView.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
                cell.titleLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                cell.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                cell.contentView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                cell.titleLabel.textColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
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

