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


struct Article: Decodable {
    let title: String
    let description: String
}
