import UIKit

class ArticleDetailViewController: UIViewController {
    
    var record: NewsEntry?
    
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleTextView: UITextView!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let record = record else { return }
        articleTitleLabel.text = record.title
        articleTextView.text = record.content
        authorLabel.text = record.author
        sourceLabel.text = "Author: \(record.author ?? "")"
        if let source = record.source {
            guard let sourceName = source["name"]
                else {
            fatalError()
        }
        
            let darkMode = UserDefaults.standard.bool(forKey: "darkMode")
            if darkMode {
                view.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
                articleTextView.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
                authorLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                articleTextView.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                sourceLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                articleTitleLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                articleTextView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                authorLabel.textColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
                articleTextView.textColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
                sourceLabel.textColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
                articleTitleLabel.textColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
            }
            
    
    }
  }
}


