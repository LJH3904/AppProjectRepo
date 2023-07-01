//
//  PoketmonView.swift
//  iOS_063_Leejehyeon
//
//  Created by LJh on 2023/07/01.
//

import SwiftUI

struct Pocketmon2View: View {

  @State var transrate : String = ""
  var body: some View {
    NavigationStack{
      Text(transrate)
        .font(.system(size: 50))
      VStack{

        ForEach(team2.poketArray) { pocketmon in
          
          Button {
            transrate = changeState(pocketmon.type)
            Team2.team2State = pocketmon.type
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

struct Poketmon2View_Previews: PreviewProvider {
    static var previews: some View {
        Pocketmon2View()
    }
}
