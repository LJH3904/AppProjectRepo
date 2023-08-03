//
//  ContentView.swift
//  WebDemoUI
//
//  Created by Jongwook Park on 2023/08/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            VStack {
                MyUILabel(text: "Hello World!")
                    .background(.purple)
                
                MyUILabel(text: "Nice to meet you!")
                    .background(.blue)
            
                MyUILabel(text: "We're welcome!")
                    .background(.green)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
