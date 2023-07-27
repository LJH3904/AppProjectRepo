//
//  ContentView.swift
//  BucketMate
//
//  Created by 유하은 on 2023/07/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
            
            TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
                HomeView().tabItem
                { Text("Home") }
                    .tag(1)
                CommunityView().tabItem
                { Text("Community") }
                    .tag(2)
                ChatListView().tabItem
                { Text("Chat") }
                    .tag(3)
                MyView().tabItem
                { Text("My") }
                    .tag(4)
            }
            .foregroundColor(.accentColor)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
