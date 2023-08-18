//
//  ContentView.swift
//  Board
//
//  Created by 변상필 on 2023/08/18.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack{
            TabView {
                NavigationStack {
                    NotiBoardView()
                    
                }
                .tabItem {
                    VStack{
                        Image(systemName: "megaphone")
                        Text("공지사항")
                    }
                    
                }
                .tag(1)
                NavigationStack {
                    CommunityView()
                }
                .tabItem {
                    VStack{
                        Image(systemName: "person.3")
                        Text("자유게시판")
                    }
                }
                .tag(2)
                NavigationStack{
                    SettingBoardView()
                }
                .tabItem {
                    VStack {
                        Image(systemName: "gearshape")
                        Text("환경 설정")
                    }
                    .tag(3)
                    
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
