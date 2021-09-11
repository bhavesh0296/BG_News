//
//  NavigationViewDemo.swift
//  BG_News
//
//  Created by bhavesh on 11/09/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import SwiftUI

struct NavigationViewDemo: View {
    @State var articles: [News] = [News]()
    
    var body: some View {
        ZStack {
            NavigationView{
                List {
                    ForEach(articles, id: \.url) { news in
                        NavigationLink(destination: NewsDetailView(url: news.url)) {
                            NewsCardView(news: news)
                        }
                    }
                }.onAppear(perform: fetchData)
                    .navigationBarTitle("News", displayMode: .large)
            }
        }
    }

    func fetchData() {
        let URL_PATH = "https://newsapi.org/v2/top-headlines?sources=engadget&country=in&apiKey=452d040207744964b395c0996a51174c"
        
        APIService.shared.fetchNews(path: URL_PATH) { (result: Result<NewsResponse, Error>) in
            switch result {
            case .success(let articlesResponse):
                articlesResponse.news.forEach { print(" -- \($0.title)") }
                self.articles = articlesResponse.news
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct NavigationViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewDemo()
    }
}
