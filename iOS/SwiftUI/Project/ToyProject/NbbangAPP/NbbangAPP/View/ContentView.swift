//
//  ContentView.swift
//  NbbangAPP
//
//  Created by LJh on 2023/07/25.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var data : MoneyStore = MoneyStore()
  var designModel : DesignModel = DesignModel()
  var body: some View {
    ZStack{
      BackgroundView()
      
        VStack(alignment: .leading){
          HeaderView()
          designModel.showLine()
          Spacer()
          
          
        }
        
      
      
      
    } // :ZStack
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
