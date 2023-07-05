//
//  PoketmonView.swift
//  iOS_063_Leejehyeon
//
//  Created by LJh on 2023/07/01.
//

import SwiftUI

struct Pocketmon2View: View {
  
  @State var transratePocketmonType : String = ""
  @State var showPocketmonName : String = ""
  var body: some View {
    NavigationStack{
      HStack{
        VStack(alignment: .leading){
          ScrollView{
            
            ForEach(team2.poketArray) { pocketmon in
              
              Button {
                transratePocketmonType = Operation.changePocketmonType(pocketmon.type)
                showPocketmonName = pocketmon.poketmonName
                Team2.team2State = pocketmon.type
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
        }
        VStack{
          Text("\(team2.name)")
            .font(.title)
            .fontDesign(.monospaced)
          Text("\(showPocketmonName)")
            .fontDesign(.monospaced)
            .bold()
          Text(transratePocketmonType)
            .font(.system(size: 50))
        }
        
      }
    }
  }
}

struct Poketmon2View_Previews: PreviewProvider {
  static var previews: some View {
    Pocketmon2View()
  }
}
