//
//  ContentView.swift
//  WebDemoUI
//
//  Created by Jongwook Park on 2023/08/03.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTabIndex: Int = 1
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            
            VStack {
                MyUILabel(text: "Hello World!")
                    .background(.purple)
                
                MyUILabel(text: "Nice to meet you!")
                    .background(.blue)
            
                MyUILabel(text: "We're welcome!")
                    .background(.green)
            }
            .tabItem {
                Label("Label", systemImage: "text.alignleft")
            }
            .tag(1)
            
            VStack {
                MyWebView()
            }
            .tabItem {
                Label("WKWebView", systemImage: "safari")
            }
            .tag(2)
            
            NavigationStack {
                VStack {
                    Text("Demo")
                    MyChartView()
                }
                .navigationTitle("Chart")
            }
            .tabItem {
                Label("Chart", systemImage: "chart.bar.xaxis")
            }
            .tag(3)
            
            NavigationStack {
                SafariView()
                    .navigationTitle("Safari View")
            }
            .tabItem {
                Label("Safari", systemImage: "safari.fill")
            }
            .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
