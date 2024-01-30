//
//  StudyGroupMLApp.swift
//  StudyGroupML
//
//  Created by Rakha Fatih Athallah on 29/01/24.
//

import SwiftUI

@main
struct StudyGroupMLApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        SystemImage.house
                        Text("Home")
                    }
                SearchView()
                    .tabItem {
                        SystemImage.search
                        Text("Search")
                    }
                RecentView()
                    .tabItem {
                        SystemImage.recent
                        Text("Recent")
                    }
                ProfileView()
                    .tabItem {
                        SystemImage.profile
                        Text("Profile")
                    }
            }.accentColor(ColorAsset.baseColor)
        }
    }
}
