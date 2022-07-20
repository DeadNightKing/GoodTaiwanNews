//
//  Article.swift
//  GoodTaiwanNews
//
//  Created by Flow_RyanChou on 2022/7/19.
//

import Foundation

struct ArticalList: Decodable {
    let articles: [Article]
}

extension ArticalList {
    
    static var all: Resource<ArticalList> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tw&category=technology&apiKey=42678638c9514b2cba614b69032aaaa2")!
        return Resource(url: url)
    }()
    
}


struct Article: Decodable {
    let title: String
    let description: String?
}
