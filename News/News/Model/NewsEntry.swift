//
//  NewsEntry.swift
//  News
//
//  Created by Rick Wolter on 10/24/18.
//  Copyright © 2018 RNWolter. All rights reserved.
//


import UIKit



struct NewsEntry: Codable {
    //let source: [String: String?]?
   // let author: String?
    let title: String?
    let description: String?
    //let url: URL? // test and see if we can get this as url
    let urlToImage: URL? // ditto
   // let publishedAt: String?
    let content: String?
    
    let image: UIImage? = nil
    
    private enum CodingKeys: String, CodingKey {
      //  case source, author, title, description, url, urlToImage, publishedAt,
        case title,description, urlToImage, content
    }
}

struct FeedResults: Codable {
    var articles: [NewsEntry]
}
