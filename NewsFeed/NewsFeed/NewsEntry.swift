//
//  NewsEntry.swift
//  NewsFeed
//
//  Created by Jerrick Warren on 10/24/18.
//  Copyright © 2018 Jerrick Warren. All rights reserved.
//

import UIKit

// read only  not going to modify
// codable -> JSON

struct NewsEntry: Codable {
   // let source: [String: String?]?
   // let author: String?
    let title: String?
    let description: String?
    let url: URL? // remember to make this a hyper link
    let urlToImage: URL?
   // let publishedAt: String?
    let content: String?
    
    // image
    let image: UIImage? = nil


// coding keys
// must perfect

private enum CodingKeys: String, CodingKey {
    case title,
         description,
         url,
         urlToImage,
         content
    }
}

struct FeedResults: Codable {
    var articles: [NewsEntry]
    
}

