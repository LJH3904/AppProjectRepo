//
//  PokemonInfoView.swift
//  PokemonBook
//
//  Created by Hyo Myeong Ahn on 2023/07/03.
//

import SwiftUI

enum EvolutionState {
  case base
  case evolution1
  case evolution2
}

struct PokemonInfoView: View {
  var basePokemon: TypeOfPokemon
  
  @State var evolutionState: EvolutionState = .base
  
  @State var selectSerialNumber: Int = 0
  @State var name: String = ""
  @State var image: String = ""
 
  var body: some View {
    VStack {
      Text("\(name)")
      
      AsyncImage(url: URL(string: image)) { Image in
        Image.resizable()
      } placeholder: {
        ProgressView()
      }

      HStack{
        Button {
          pressButtonLogic(evolState: .base)
        } label: {
          Text("기본형")
            .font(.largeTitle)
        }
        Button {
          pressButtonLogic(evolState: .evolution1)
          
        } label: {
          Text("진화형")
            .font(.largeTitle)
            
        }
        Button {
          pressButtonLogic(evolState: .evolution2)
         
        } label: {
          Text("최종진화")
            .font(.largeTitle)
            
        }
      }
    }
  }
  
  func pressButtonLogic(evolState: EvolutionState) {
    
    switch evolState {
      case .base:
        
          name = basePokemon.name
          image = basePokemon.image
         
        
      case .evolution1:
        for evolution1 in evolution1PokemonList {
          if evolution1.serialNumber == (basePokemon.serialNumber + 1) {
            name = evolution1.name
            evolutionState = .evolution1
            image = evolution1.image
          }
        }
      case .evolution2:
        for evolution2 in evolution2PokemonList {
          if evolution2.serialNumber == (basePokemon.serialNumber + 2) {
            name = evolution2.name
            image = evolution2.image
            evolutionState = .evolution2
          }
        }
    }//switch
  }
  
}

struct PokemonInfoView_Previews: PreviewProvider {
  static var previews: some View {
    PokemonInfoView(basePokemon: basePokemonList[0])
  }
}
