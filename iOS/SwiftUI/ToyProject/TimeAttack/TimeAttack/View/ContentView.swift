//
//  ContentView.swift
//  TimeAttack
//
//  Created by LJh on 2023/07/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var timerData : TimerData
  
  
    var body: some View {
      NavigationStack{
        VStack{
          //MARK: - text
          Text("타이머 카운트 = \(timerData.timeCount) ")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
          
          Button {
            resetCount()
          } label: {
            Text("ResetCount")
          }
          
          NavigationLink {
            SecondView()
          } label: {
            Text("SecondView")
          }


        }
      } // : NVGTStack
    }
  func resetCount(){
    timerData.resetCount()
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
