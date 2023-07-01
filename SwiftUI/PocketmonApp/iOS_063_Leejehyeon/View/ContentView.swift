//
//  ContentView.swift
//  iOS_063_Leejehyeon
//
//  Created by LJh on 2023/07/01.
//

import SwiftUI

struct ContentView: View {
  let goResultImg : String = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBIz_CjHJgh9L5MbSiyChlJ_x7BOSnQ41p8g&usqp=CAU"
  var body: some View {
    
    NavigationStack {
      
      VStack() {
          HStack(alignment: .center){
            Pocketmon1View()
            Pocketmon2View()
          }
          
          NavigationLink {
            ResultView()
          } label: {
            AsyncImage(url:URL(string: goResultImg)! ) { image in
              image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 75, height: 75)
            } placeholder: {
              ProgressView()
            }
          }
      }
      .padding()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
