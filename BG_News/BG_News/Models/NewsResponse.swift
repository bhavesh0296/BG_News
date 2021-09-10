//
//  Result.swift
//  BG_News
//
//  Created by bhavesh on 10/09/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

struct NewsResponse: Codable {
    var news: [News]

    enum CodingKeys: String, CodingKey {
        case news = "articles"
    }
}

struct News: Codable {
//    var id: UUID = UUID()
    var url: String
    var title: String
    var description: String?
    var urlToImage: String?
}
