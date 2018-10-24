import UIKit

class TableViewController: UITableViewController {
    
    let reuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
        
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
        
        ImageLoader.fetchImage(from: record.urlToImage) { (image) in
            guard let image = image else { return }
            DispatchQueue.main.async {
                cell.contentImageView.image = image
            }
        }
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "articleSegue" {
            guard let destination = segue.destination as? DetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else {return}
            
            destination.record = Model.shared.records[indexPath.row]
    }
}
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "articleSegue", sender: tableView)
    }
}

