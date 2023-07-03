//
//  ContentView.swift
//  PokemonBook
//
//  Created by Hyo Myeong Ahn on 2023/07/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    BasePokemonView(type: "풀")
                } label: {
                    Text("풀")
                }
                NavigationLink {
                  BasePokemonView(type: "불")
                } label: {
                    Text("불")
                }
              NavigationLink {
                BasePokemonView(type: "물")
              } label: {
                  Text("물")
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

