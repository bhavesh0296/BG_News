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
            .navigationBarItems(trailing: Button(action: {
                self.shareUrlButton()
            }, label: {
                Image(systemName: "square.and.arrow.up")
            }))
    }

    func shareUrlButton() {
        guard let url = URL(string: self.url) else { return }
        let avc = UIActivityViewController(activityItems: [url], applicationActivities: nil)

        UIApplication.shared.windows.first?.rootViewController?.present(avc,
                                                                        animated: true,
                                                                        completion: nil)
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(url: "")
    }
}
