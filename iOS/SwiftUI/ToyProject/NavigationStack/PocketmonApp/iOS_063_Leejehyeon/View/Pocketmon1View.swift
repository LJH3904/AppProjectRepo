//
//  PoketmonView.swift
//  iOS_063_Leejehyeon
//
//  Created by LJh on 2023/07/01.
//

import SwiftUI

struct Pocketmon1View: View {
  @State var transratePocketmonType : String = ""
  @State var showPocketmonName : String = ""
  
  var body: some View {
    NavigationStack{
      HStack{
        VStack(alignment: .leading){
          
          ForEach(shuffledPocketmonArray) { pocketmon in
            Button {
              transratePocketmonType = Operation.changePocketmonType(pocketmon.type)
              showPocketmonName = pocketmon.poketmonName
              Team1.team1State = pocketmon.type
            } label: {
              AsyncImage(url: pocketmon.locationURL) { image in
                image
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 75, height: 75)
                  .clipShape(Circle())
              } placeholder: {
                ProgressView()
              }
            }
          }.aspectRatio( contentMode: .fit)
        }
        VStack{
          Text("\(team1.name)")
            .font(.title)
            .fontDesign(.monospaced)
          Text("\(showPocketmonName)")
            .bold()
            .fontDesign(.monospaced)
          Text(transratePocketmonType)
            .font(.system(size: 50))
        }
        
      }
    }
  }
}

struct PoketmonView_Previews: PreviewProvider {
  static var previews: some View {
    Pocketmon1View()
  }
}
