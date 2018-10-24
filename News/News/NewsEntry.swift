import UIKit

struct NewsEntry: Codable {
    let source: [String: String?]?
    let author: String?
    let title: String?
    let description: String?
    let url: URL?
    let urlToImage: URL?
    let publishedAt: String?  //convert to Date()
    let content: String?
    
    let image: UIImage? = nil
    
    private enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, urlToImage, publishedAt, content
    }
}

struct FeedResults: Codable {
    var articles: [NewsEntry]
}
