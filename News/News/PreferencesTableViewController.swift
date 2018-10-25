import UIKit

var isDarkMode: Bool = false

class PreferencesTableViewController: UITableViewController {
    
    @IBOutlet weak var numberOfArticlesLabel: UILabel!
    @IBOutlet weak var articlesSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBOutlet weak var pinkaliciousModeLabel: UILabel!
    @IBOutlet weak var pinkaliciousModeSwitch: UISwitch!
    
    // MARK: - View loading
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Theme style
    
    func enableDarkMode() {
        self.darkModeLabel.textColor = UIColor.white
        self.darkModeSwitch.setOn(true, animated: true)
    }
    
    func disableDarkMode() {
        self.darkModeLabel.textColor = UIColor.black
        self.darkModeSwitch.setOn(false, animated: true)
    }
    
    // MARK: - Actions
    
    
    @IBAction func articlesSegmentControlAction(_ sender: Any) {
        switch articlesSegmentControl.selectedSegmentIndex {
        case 0:
            UserDefaults.standard.set(0, forKey: "numberOfArticles")
        case 1:
            UserDefaults.standard.set(1, forKey: "numberOfArticles")
        case 2:
            UserDefaults.standard.set(2, forKey: "numberOfArticles")
        case 3:
            UserDefaults.standard.set(3, forKey: "numberOfArticles")
        default:
            UserDefaults.standard.set(0, forKey: "numberOfArticles")
        }
    }
    
    @IBAction func toggleDarkModeSwitch(_ sender: Any) {
        
    }
    
    @IBAction func doneAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data:
    
    // MARK: - Navigation
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        <#code#>
//    }
    
}
