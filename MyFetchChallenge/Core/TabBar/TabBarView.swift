//
//  TabBarView.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 6/09/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            
            HomeFactory.create()
                .tabItem {
                    Label("Home", systemImage: "house")
                        
                }
               
                    
            FavoritesView()
                .tabItem {
                   Label("Favorites", systemImage: "heart")
                }
                    
            SettingsView()
                .tabItem {
                  Label("Settings", systemImage: "gear")
                    }
                }
        .accentColor(.primaryColor)
    }
}

#Preview {
    TabBarView()
}

