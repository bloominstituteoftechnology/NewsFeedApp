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
        let apiKeyItem = URLQueryItem(name: "apiKey", value: "e10370bb15bb40079bd18129a4b7b0b5")
        components.queryItems = [countryItem, apiKeyItem]
        
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
            } catch {
                NSLog("Unable to decode data into news entries: \(error)")
                completion()
            }
        }
        dataTask.resume()
    }
}
