import UIKit

class PreferencesTableViewController: UITableViewController {
    
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
    
    func updateView() {
        let darkMode = defaults.bool(forKey: "darkMode")
        let pinkaliciousMode = defaults.bool(forKey: "pinkaliciousMode")
        let segmentedControl = defaults.integer(forKey: "numberOfArticles")
        
        articlesSegmentControl.selectedSegmentIndex = segmentedControl
        darkModeSwitch.isOn = darkMode
        pinkaliciousModeSwitch.isOn = pinkaliciousMode
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
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
    
    
    
    func darkMode() {
        if darkModeSwitch.isOn {
            defaults.set(true, forKey: "darkMode")
        } else {
            defaults.set(false, forKey: "darkMode")
        }
    }
    
    func pinkaliciousMode() {
        if pinkaliciousModeSwitch.isOn {
            defaults.set(true, forKey: "pinkaliciousMode")
        } else {
            defaults.set(false, forKey: "pinkaliciousMode")
        }
    }
    
    @IBAction func toggleDarkModeSwitch(_ sender: UISwitch) {
        darkMode()
    }
    
    @IBAction func togglePinkaliciousModeSwitch(_ sender: UISwitch) {
        pinkaliciousMode()
    }
    
    
    @IBAction func doneAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
