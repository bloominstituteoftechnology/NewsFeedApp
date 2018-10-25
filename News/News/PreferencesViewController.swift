import UIKit

class PreferencesViewController: UIViewController {
    
    var isDarkMode: Bool = false
    var isBlueMode: Bool = false
    
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
//        segmentOutlet.selectedSegmentIndex = [10 : 0, 20 : 1, 50 : 2, 100 : 3]
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
    
    @IBAction func blueMode(_ sender: Any) {
        if isBlueMode {
            UserDefaults.standard.set(true, forKey: "blueMode")
            isBlueMode.toggle()
        } else {
            UserDefaults.standard.set(false, forKey: "blueMode")
            isBlueMode.toggle()
        }
    }
    
    
    func updateViews() {
        let darkMode = UserDefaults.standard.bool(forKey: "darkMode")
        let blueMode = UserDefaults.standard.bool(forKey: "blueMode")
        let segmentedControl = UserDefaults.standard.integer(forKey: "numberOfArticles")
        segmentOutlet.selectedSegmentIndex = segmentedControl
        isDarkMode = darkMode
        isBlueMode = blueMode
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
}

