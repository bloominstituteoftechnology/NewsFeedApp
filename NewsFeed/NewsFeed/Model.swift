//
//  Model.swift
//  NewsFeed
//
//  Created by Jerrick Warren on 10/24/18.
//  Copyright © 2018 Jerrick Warren. All rights reserved.
//

import UIKit

// create our singleton
class Model {
    static let shared = Model()
    private init() {}
    
    // Records as an emptry array
    var records: [NewsEntry] = []
    
    // create a fetch method
    func fetch(completion: @escaping () -> Void = { } ) {
        
        guard
            let baseURL = URL(string:"https://newsapi.org/v2/top-headlines"),
            var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
            else { fatalError("Unable to set up url and components") }
        
        // construct the URL
        // pass in the API Key
        // ? -> this is for the QueryItem
        
        let countryItem = URLQueryItem(name: "country", value: "us")
        let apiKeyItem = URLQueryItem(name: "apiKey", value: "75558de9f7af473f832c7a0532b76365")
        // https://newsapi.org/v2/top-headlines?country=us&apiKey=75558de9f7af473f832c7a0532b76365
        
        components.queryItems = [countryItem, apiKeyItem]
        
        guard let fetchURL = components.url else {
            fatalError("Components could not construct proper search query")
        }
        
        // create a dataTask
        
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
                NSLog("Unable to decode data into news entries")
                completion()
            }
        }
        dataTask.resume()
    }
}
