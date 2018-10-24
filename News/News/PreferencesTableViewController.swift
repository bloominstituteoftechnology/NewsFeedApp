import UIKit

class PreferencesTableViewController: UITableViewController {
    
    @IBOutlet weak var numberOfArticlesLabel: UILabel!
    @IBOutlet weak var articlesSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBOutlet weak var pinkaliciousModeLabel: UILabel!
    @IBOutlet weak var pinkaliciousModeSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    

    
    // MARK: - Navigation
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        <#code#>
//    }
    
}
