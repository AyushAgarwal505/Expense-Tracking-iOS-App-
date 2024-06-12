//
//  ContentView.swift
//  TrackIt
//
//  Created by Ayush Agarwal on 10/06/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    var body: some View {
        TabView{
            Recents()
                .tag(Tab.recents)
                .tabItem { Tab.recents.tabContent }
            Search()
                .tag(Tab.search)
                .tabItem { Tab.search.tabContent }
            Settings()
                .tag(Tab.settings)
                .tabItem { Tab.settings.tabContent }
        }
        .sheet(isPresented: $isFirstTime, content: {
            IntroScreen()
                .interactiveDismissDisabled()
        })
    }
}

#Preview {
    ContentView()
}
