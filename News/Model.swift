//
//  Model.swift
//  News
//
//  Created by Nikita Thomas on 10/24/18.
//  Copyright © 2018 Nikita Thomas. All rights reserved.
//

import Foundation

class Model {
    static let shared = Model()
    private init() {}
    
    var records: [NewsEntry] = []
    
    func fetch(completion: @escaping () -> Void = {}) {
        guard
            let baseURL = URL(string: "https://newsapi.org/v2/top-headlines"),
            var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
            else {
                fatalError("Unable to set up url + components") }
        
        let countryItem = URLQueryItem(name: "country", value: "us")
        let apiKeyItem = URLQueryItem(name: "apiKey", value: "e272bc5703cd4728b50c5e6588bc96ff")
        components.queryItems = [countryItem, apiKeyItem]
        
        guard let requestURL = components.url else {
            fatalError("Cannot build request URL from components")
        }
        
        let dataTask = URLSession.shared.dataTask(with: requestURL) { data, _, error in
            guard error == nil,
                let data = data else {
                    NSLog("Unable to run dataTask to fetch data")
                    completion()
                    return
            }
            
            do {
                let searchResults = try JSONDecoder().decode(FeedResults.self, from: data)
                self.records = searchResults.articles
                completion()
                
            } catch {
                NSLog("Unable to decode data into newsEntries: \(error)")
                completion()
                return
            }
            
        }
        dataTask.resume()
    }
    
}
