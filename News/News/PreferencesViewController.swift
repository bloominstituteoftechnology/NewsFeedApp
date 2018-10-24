import UIKit

class PreferencesViewController: UIViewController {
    
    var isDarkMode: Bool = false
    var isLightMode: Bool = true
    
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    @IBAction func segmentedAction(_ sender: Any) {
        switch segmentOutlet.selectedSegmentIndex {
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
    
    @IBAction func darkMode(_ sender: Any) {
        if isDarkMode {
            UserDefaults.standard.set(true, forKey: "darkMode")
            isDarkMode.toggle()
        } else {
            UserDefaults.standard.set(false, forKey: "darkMode")
            isDarkMode.toggle()
        }
    }
    
    @IBAction func lightMode(_ sender: Any) {
        if isLightMode {
            UserDefaults.standard.set(true, forKey: "darkMode")
            isLightMode.toggle()
        } else {
            UserDefaults.standard.set(false, forKey: "darkMode")
            isLightMode.toggle()
        }
    }
    
    
    func updateViews() {
        let darkMode = UserDefaults.standard.bool(forKey: "darkMode")
        let segmentedControl = UserDefaults.standard.integer(forKey: "numberOfArticles")
        segmentOutlet.selectedSegmentIndex = segmentedControl
        isDarkMode = darkMode
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
}

