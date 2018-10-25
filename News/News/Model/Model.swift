//
//  Model.swift
//  News
//
//  Created by Rick Wolter on 10/24/18.
//  Copyright © 2018 RNWolter. All rights reserved.
//

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
        let apiKeyItem = URLQueryItem(name: "apiKey", value: "2bf8808204c245f2beb2a2d9d8ef20ba")
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
