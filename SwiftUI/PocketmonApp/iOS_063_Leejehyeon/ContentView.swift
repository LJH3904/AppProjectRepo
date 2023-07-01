//
//  ContentView.swift
//  iOS_063_Leejehyeon
//
//  Created by LJh on 2023/07/01.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
      
      NavigationStack {
        ZStack{
          
            Color(.blue).ignoresSafeArea()
            VStack {
              HStack{
                Pocketmon1View()
                Pocketmon2View()
              }
              Text("-----------------------------------------------")
              NavigationLink {
                ResultView()
              } label: {
                
                Text("결과창")
                  .font(.system(size: 50))
                  .foregroundColor(.white)
              }
            }
            .padding()
        }
      }
    
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
