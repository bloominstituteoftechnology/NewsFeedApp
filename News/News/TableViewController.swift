import UIKit

class TableViewController: UITableViewController {
    
    let reuseIdentifier = "newcell"
    let defaults = UserDefaults.standard
    let pinkalicious = UIColor(red: 1, green: 0.549, blue: 0.549, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Model.shared.fetch {
            DispatchQueue.main.async { self.tableView.reloadData() }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.records.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell! = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TableViewCell
        
        let record = Model.shared.records[indexPath.row]
        
        cell.titleLabel.text = record.title
        cell.descriptionLabel.text = record.description
        cell.textView.text = record.content
        
        ImageLoader.fetchImage(from: record.urlToImage) { image in
            guard let image = image else { return }
            DispatchQueue.main.async {
                cell.contentImageView.image = image
            }
        }
        
        let darkMode = defaults.bool(forKey: "darkMode")
        DispatchQueue.main.async {
            if darkMode {
                cell.backgroundColor = UIColor.black
                cell.contentView.backgroundColor = UIColor.black
                tableView.backgroundColor = UIColor.black
                cell.titleLabel.textColor = UIColor.white
            } else {
                cell.backgroundColor = UIColor.white
                cell.contentView.backgroundColor = UIColor.white
                tableView.backgroundColor = UIColor.white
                cell.titleLabel.textColor = UIColor.black
            }
        }
        
        let pinkaliciousMode = defaults.bool(forKey: "pinkaliciousMode")
        DispatchQueue.main.async {
            if pinkaliciousMode {
                cell.backgroundColor = self.pinkalicious
                cell.contentView.backgroundColor = self.pinkalicious
                tableView.backgroundColor = self.pinkalicious
                cell.titleLabel.textColor = UIColor.white
            } else {
                cell.backgroundColor = UIColor.white
                cell.contentView.backgroundColor = UIColor.white
                tableView.backgroundColor = UIColor.white
                cell.titleLabel.textColor = UIColor.black
            }
        }
        
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ArticleDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow?.row else { return }
        destination.record = Model.shared.records[indexPath]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ArticleSegue", sender: tableView)
    }
    
    
}
