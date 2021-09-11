//
//  PreferencesView.swift
//  BG_News
//
//  Created by bhavesh on 11/09/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import SwiftUI

struct PreferencesView: View {

    @State private var newsSource = -1
    @State private var contentToDisplay = 0

    @EnvironmentObject var newsURLChoices: NewsURLSources

    let keys = NewsURLSources().sources.map { $0.key }.sorted()

    let values = NewsURLSources().sources.map {$0.value}.sorted()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("News Sources")) {
                    Picker(selection: $newsSource,
                           label: Text("Display News From")) {
                            ForEach(0..<values.count) {
                                Text(self.values[$0])
                            }
                    }
                }

                Section(header: Text("Content To Display")) {
                    Picker(selection: $contentToDisplay,
                           label: Text("")) {
                            Text("Top Headlines").tag(0)
                            Text("Everything").tag(1)
                    }.pickerStyle(SegmentedPickerStyle())
                }
            }.onAppear {
                if self.newsSource < 0 {
                    self.newsSource = self.keys
                        .firstIndex(of: self.newsURLChoices.source) ?? 0
                } else {
                    self.newsURLChoices.source = self.keys[self.newsSource]

                    UserDefaults.standard.set(self.newsURLChoices.source, forKey: "source")
                }

                self.contentToDisplay = self.newsURLChoices.content == "top-headlines" ?
                    0 : 1
            }
            .onDisappear {
                self.newsURLChoices.content = self.contentToDisplay == 0 ?
                    self.newsURLChoices.displayContentType[0] : self.newsURLChoices.displayContentType[1]

                UserDefaults.standard.set(self.newsURLChoices.content, forKey: "content")
            }

            .navigationBarTitle("Preferences", displayMode: .inline)
        }
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
