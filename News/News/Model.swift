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
        
        let pageSize = URLQueryItem(name:"pageSize", value:"\(Preferences.shared.pageSize)")
        let apiKeyItem = URLQueryItem(name: "apiKey", value: "a31e69e85e8e4cc6bd72c679cb7c8c52")
        components.queryItems = [apiKeyItem, pageSize]
        
        if let category = Preferences.shared.category {
            components.queryItems?.append(URLQueryItem(name:"category", value:"\(category)"))
        }
 
        
        if let countryItem = Preferences.shared.country {
            components.queryItems?.append(URLQueryItem(name:"country", value:"\(countryItem)"))
        }
        
        
        
        
        
        guard let fetchURL = components.url else {
            fatalError("Components could not construct proper search query")
        }
        
        print(fetchURL)
        
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
            } catch {
                NSLog("Unable to decode data into news entries: \(error)")
                completion()
            }
        }
        dataTask.resume()
    }
}

