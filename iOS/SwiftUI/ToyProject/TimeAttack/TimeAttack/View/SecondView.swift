//
//  SecondView.swift
//  TimeAttack
//
//  Created by LJh on 2023/07/25.
//

import SwiftUI

struct SecondView: View {
  
  @EnvironmentObject var timerData : TimerData
  
  var body: some View {
    VStack{
      Text("Second View")
        .font(.largeTitle)
      Text("Timer Count = \(timerData.timeCount)")
        .font(.headline)
      Button {
        timerData.resetCount()
      } label: {
        Text("ResetCount")
      }
    } // : VStack
    
  }
}

struct
SecondView_Previews: PreviewProvider {
  static var previews: some View {
    SecondView()
      
  }
}
