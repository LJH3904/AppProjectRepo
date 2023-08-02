//
//  CountView.swift
//  HomeWork3
//
//  Created by LJh on 2023/08/01.
//

import SwiftUI

struct CountView: View {
  @ObservedObject var numberStore : NumberStore = NumberStore()
  @State var showingCount : Int = 0
  var body: some View {
    
    ZStack {
      Color(.brown).ignoresSafeArea()
      
      VStack{
        Button {
          showingCount += 1
        } label: {
          Text("\(showingCount)")
            .SetCountViewTextDesign()
        }.SetCountViewButtonDesign()
        HStack{
          Button {
            numberStore.addNumbers(n: showingCount, date: Date())
            numberStore.saveNumbers()
          } label: {
            Text("저장하기")
              .SetCountViewTextDesign()
          }
          Button {
            showingCount = 0
          } label: {
            Text("초기화")
              .SetCountViewTextDesign()
          }

        }
      }
    }
  }
    
}

struct CountView_Previews: PreviewProvider {
    static var previews: some View {
        CountView()
    }
}
