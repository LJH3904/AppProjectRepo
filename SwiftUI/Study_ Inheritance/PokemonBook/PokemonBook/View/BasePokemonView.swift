//
//  BasePokemonView.swift
//  PokemonBook
//
//  Created by Hyo Myeong Ahn on 2023/07/03.
//

import SwiftUI

struct BasePokemonView: View {
    var type: String
    
    var body: some View {
        List(basePokemonList) { basePokemon in
            if basePokemon.type == type {
                NavigationLink {
                    PokemonInfoView(basePokemon: basePokemon)
                } label: {
                    Text("\(basePokemon.name)")
                }                
            }
        }.navigationTitle("\(type) 속성")
    }
}

struct BasePokemonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            
            BasePokemonView(type: "불")
        }
    }
}
