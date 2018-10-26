import UIKit

class PreferencesTableViewController: UITableViewController {
    
    var isDarkMode: Bool = false
    
    let defaults = UserDefaults.standard
    
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
    
    func updateViews() {
        let darkMode = defaults.bool(forKey: "darkMode")
        isDarkMode = darkMode
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
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
            defaults.set(0, forKey: "numberOfArticles")
        case 1:
            defaults.set(1, forKey: "numberOfArticles")
        case 2:
            defaults.set(2, forKey: "numberOfArticles")
        case 3:
            defaults.set(3, forKey: "numberOfArticles")
        default:
            defaults.set(0, forKey: "numberOfArticles")
        }
    }
    
    @IBAction func toggleDarkModeSwitch(_ sender: Any) {
        if isDarkMode == true {
            defaults.set(true, forKey: "darkMode")
            isDarkMode.toggle()
        } else {
            defaults.set(false, forKey: "darkMode")
            isDarkMode.toggle()
        }
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
