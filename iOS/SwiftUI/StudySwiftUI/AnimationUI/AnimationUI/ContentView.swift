//
//  ContentView.swift
//  AnimationUI
//
//  Created by Jongwook Park on 2023/07/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTabIndex: Int = 1
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            AnimationView()
                .tabItem {
                    Image(systemName: "film.stack")
                    Text("Animation")
                }
                .tag(1)
            TransitionView()
                .tabItem {
                    Image(systemName: "list.and.film")
                    Text("Transition")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
