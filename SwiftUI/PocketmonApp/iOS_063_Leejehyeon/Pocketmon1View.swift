//
//  PoketmonView.swift
//  iOS_063_Leejehyeon
//
//  Created by LJh on 2023/07/01.
//

import SwiftUI

struct Pocketmon1View: View {
  @State var transrate : String = ""
  var body: some View {
    NavigationStack{
      Text(transrate)
        .font(.system(size: 50))
      VStack{
        
        ForEach(team1.poketArray) { pocketmon in
          
          Button {
            transrate = changeState(pocketmon.type)
            Team1.team1State = pocketmon.type
          } label: {
            Text("\(pocketmon.poketmonName)")
              .font(.system(size: 30))
              .foregroundColor(.white)
          }
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
