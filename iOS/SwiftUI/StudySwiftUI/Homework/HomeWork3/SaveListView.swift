//
//  SaveListView.swift
//  HomeWork3
//
//  Created by LJh on 2023/08/01.
//

import SwiftUI

struct SaveListView: View {
  @ObservedObject var numberStore : NumberStore = NumberStore()
  
  var body: some View {
    ZStack{
      Color(.brown).ignoresSafeArea()
      VStack{
        List{
          ForEach(numberStore.numberStore){ num in
            HStack{
              Text("\(num.number)")
              Text("\(num.date)")
            }
          }
        }
        
      }
      
    }.refreshable {
      numberStore.fetchNumbers()
    }
    .onAppear {
      numberStore.fetchNumbers()
      
    }
    
  }
}

struct SaveListView_Previews: PreviewProvider {
  static var previews: some View {
    SaveListView()
  }
}
