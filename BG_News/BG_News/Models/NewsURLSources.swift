//
//  NewsURLSources.swift
//  BG_News
//
//  Created by bhavesh on 11/09/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

class NewsURLSources: ObservableObject {
    
    var sources = [
        "bloomberg": "Bloomberg",
        "buzzfeed": "Buzzfeed",
        "cbs-news": "CBS News",
        "engadget": "Engadget",
        "fortune": "Fortune",
        "abc-news":"ABC News",
        "ars-technica":"Ars Technica",
        "associated-press": "Associated Press",
        "bbc-news": "BBC News",
        "google-news": "Google News",
        "hacker-news": "Hacker News",
        "new-scientist": "New Scientist",
        "newsweek": "Newsweek",
        "new-york-magazine": "New York Magazine",
        "reuters": "Reuters",
        "techcrunch": "TechCrunch"
    ]

    var displayContentType = ["top-headlines","everything"]

    @Published var source  = "engadget"
    @Published var content = "top-headlines"
}
