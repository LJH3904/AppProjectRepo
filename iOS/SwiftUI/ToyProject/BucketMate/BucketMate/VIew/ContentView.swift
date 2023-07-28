//
//  ContentView.swift
//  BucketMate
//
//  Created by 유하은 on 2023/07/27.
//

import SwiftUI

struct ContentView: View {
    @State var index: Int = 0
    @EnvironmentObject var postStore: PostStore
    
    var body: some View {
        VStack {
            TabView {
                NavigationStack {
                    HomeView()
                }.tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("홈")
                    }
                }.tag(1)
                NavigationStack {
                    CommunityView()
                }.tabItem {
                    VStack {
                        Image(systemName: "person.3")
                        Text("커뮤니티")
                    }
                }.tag(2)
                NavigationStack {
                    ChatListView()
                }.tabItem {
                    VStack {
                        Image(systemName: "text.bubble")
                        Text("채팅")
                    }
                }.tag(3)
                NavigationStack {
                    MyView()
                }.tabItem {
                    VStack {
                        Image(systemName: "person.circle")
                        Text("마이")
                    }
                }
                .tag(4)
            }
            .toolbarBackground(.white, for: .tabBar)
            .tint(.bucketColor)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
        .environmentObject(PostStore())
    }
}
