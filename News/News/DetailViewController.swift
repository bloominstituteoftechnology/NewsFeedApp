import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var headline: UILabel!
    @IBOutlet var source: UILabel!
    @IBOutlet var content: UITextView!
    @IBOutlet var author: UILabel!
    
    var record: NewsEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let record = record else { return }
        headline.text = record.title
        content.text = record.content
        author.text = record.author
        source.text = "Author: \(record.author ?? "")"
        if let source = record.source {
            guard let sourceName = source["name"]
                else {
                    fatalError("no source")
            }
        }
    }
    
    
}
