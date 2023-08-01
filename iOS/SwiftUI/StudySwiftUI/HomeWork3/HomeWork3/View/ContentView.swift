//
//  ContentView.swift
//  HomeWork3
//
//  Created by LJh on 2023/08/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      ZStack{
        Color(.brown).ignoresSafeArea()
        TabView{
          NavigationStack {
            CountView()
          }.tabItem {
            VStack {
              Image(systemName: "plus.circle.fill")
              Text("카운터")
              
            }
          }.tag(1)
          NavigationStack {
            SaveListView()
          }.tabItem {
            VStack {
              Image(systemName: "list.clipboard")
              
              Text("리스트")
              
            }
          }.tag(2)
          NavigationStack {
            ThirdView()
          }.tabItem {
            VStack {
              Image(systemName: "bolt")
              Text("사용방법")
              
            }
          }.tag(2)
        } .padding()
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
