import Foundation

class Model {
    static let shared = Model()
    private init() {}
    
    var records: [NewsEntry] = []
    
    func fetch(completion: @escaping () -> Void = { }) {
    
        guard
            let baseURL = URL(string: "https://newsapi.org/v2/top-headlines"),
            var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
            else { fatalError("Unable to set up url and components") }
        
        let countryItem = URLQueryItem(name: "country", value: "us")
        let apiKeyItem = URLQueryItem(name: "apiKey", value: "e3394798a5f94c07915b01d2e7a0e787")
        components.queryItems = [countryItem, apiKeyItem]
        
        switch UserDefaults.standard.integer(forKey: "numberOfArticles") {
        case 0:
            components.queryItems?.append(URLQueryItem(name: "pageSize", value: "10"))
        case 1:
            components.queryItems?.append(URLQueryItem(name: "pageSize", value: "20"))
        case 2:
            components.queryItems?.append(URLQueryItem(name: "pageSize", value: "50"))
        case 3:
            components.queryItems?.append(URLQueryItem(name: "pageSize", value: "100"))
        default:
            components.queryItems?.append(URLQueryItem(name: "pageSize", value: "10"))
        }
        
        
        guard let fetchURL = components.url else {
            fatalError("Components could not construct proper search query")
        }
        
        let dataTask = URLSession.shared.dataTask(with: fetchURL) { data, _, error in
            
            guard error == nil,
                let data = data else {
                    NSLog("Unable to fetch data")
                    completion()
                    return
            }
            
            do {
                let searchResults = try JSONDecoder().decode(FeedResults.self, from: data)
                self.records = searchResults.articles
                completion()
                return
                
            } catch {
                NSLog("Unable to decode data into news entries: \(error)")
            }
        }
        dataTask.resume()
    }
}
