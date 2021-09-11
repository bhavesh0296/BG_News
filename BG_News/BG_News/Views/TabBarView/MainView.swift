//
//  MainView.swift
//  BG_News
//
//  Created by bhavesh on 11/09/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @State var articles: [News] = [News]()

    @EnvironmentObject var newsUrlChoices: NewsURLSources
    
    var body: some View {
        ZStack {
            NavigationView{
                List {
                    ForEach(articles, id: \.url) { news in
                        NavigationLink(destination:  NewsDetailView(url: news.url)) {
                            NewsCardView(news: news)
                        }
                    }
                }.onAppear(perform: fetchData)
                    .navigationBarTitle("News", displayMode: .large)
            }
        }
    }
    
    func fetchData() {
        print("----------------")
        print(self.newsUrlChoices.content)
        print(self.newsUrlChoices.source)
        print("----------------")

        let path = "https://newsapi.org/v2/\(newsUrlChoices.content)?sources=\(newsUrlChoices.source)&apiKey=452d040207744964b395c0996a51174c"

        print(path)

        APIService.shared.fetchNews(path: path) { (result: Result<NewsResponse, Error>) in
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
