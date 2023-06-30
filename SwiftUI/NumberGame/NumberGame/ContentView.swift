//
//  ContentView.swift
//  NumberGame
//
//  Created by LJh on 2023/06/19.
//

import SwiftUI

struct ContentView: View {
  @State var randomInt : Int = 0
  @State var showText : String = ""
  @State var count : Int = 0
  var body: some View {
    VStack {
    
      
      Text("몇번 바꿧게 \(count)")
      Text(showText)
      
      HStack(spacing: 10){
        ForEach(0..<11) { num in
          Button("\(num)") {
            showText = num == randomInt ? "정답" : "틀림"
            count += 1
          }
        }
      }
      .padding()
      .font(.largeTitle)
      
      
      Button("새로운 게임 시작") {
        randomInt = Int.random(in: 0...10)
        showText = "새로 시작"
        count = 0
      }
    }
  }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
