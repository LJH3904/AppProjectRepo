//
//  ContentView.swift
//  BucketMate
//
//  Created by 유하은 on 2023/07/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }.tabItem { Text("Home") }
                .tag(1)
            NavigationStack {
                CommunityView()
            }.tabItem { Text("Community") }
                .tag(2)
            NavigationStack {
                ChatListView()
            }.tabItem { Text("Chat") }
                .tag(3)
            NavigationStack {
                MyView()
            }.tabItem { Text("My") }
                .tag(4)
        }
        .toolbarBackground(.white, for: .tabBar)
        .tint(.bucketColor)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
    }
}
