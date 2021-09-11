//
//  TabBarView.swift
//  BG_News
//
//  Created by bhavesh on 11/09/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import SwiftUI

struct TabBarView: View {


    var body: some View {
        TabView {

            MainView()
                .tabItem {
                    Image(systemName: "doc.richtext")
                    Text("News")
            }

            PreferencesView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Preferences")
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
