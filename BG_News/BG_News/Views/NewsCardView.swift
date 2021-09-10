//
//  NewsCardView.swift
//  BG_News
//
//  Created by bhavesh on 10/09/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct NewsCardView: View {

    var news: News

    var body: some View {

        HStack(alignment: .top) {

            KFImage(URL(string: news.urlToImage ?? ""))
                .placeholder {
                    // Placeholder while downloading.
                    Text("Loading...")
                        .font(.system(size: 8))
                        .opacity(0.3)
            }
            .resizable()
            .frame(width: 120, height: 120, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.black.opacity(0.8), lineWidth: 1))

            VStack (alignment: .leading, spacing: 8.0) {
                Text(news.title)
                    .font(.system(size: 14))
                    .bold()
                    .foregroundColor(.black)

                Text(news.description ?? "")
                    .font(.system(size: 12))
                    .foregroundColor(Color.black.opacity(0.6))
            }
        }
    }
}

struct NewsCardView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCardView(news: News(url: "", title: "", description: "", urlToImage: ""))
    }
}
