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
    }
  }
}


