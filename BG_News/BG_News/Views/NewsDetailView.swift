//
//  NewsDetailView.swift
//  BG_News
//
//  Created by bhavesh on 10/09/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import SwiftUI

struct NewsDetailView: View {

    let url: String

    var body: some View {
        WebView(request: URLRequest(url: URL(string: url)!))
            .navigationBarTitle("News Detail", displayMode: .inline)
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(url: "")
    }
}
