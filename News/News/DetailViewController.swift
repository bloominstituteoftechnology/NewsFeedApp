import UIKit

class DetailViewController: UIViewController {
    
    var record: NewsEntry?
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var articleContentView: UITextView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let record = record else {return}
        articleTitleLabel.text = record.title
        articleContentView.text = record.content
        descriptionLabel.text = record.description
        authorLabel.text = record.author
        
        ImageLoader.fetchImage(from: record.urlToImage) { (image) in
            guard let image = image else { return }
            DispatchQueue.main.async {
                self.articleImageView.image = image
            }
        }
        
        }
}
