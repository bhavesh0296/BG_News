//
//  ContentView.swift
//  BG_News
//
//  Created by bhavesh on 10/09/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {

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
        APIService.shared.fetchNews { (result: Result<NewsResponse, Error>) in
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
