//
//  ResultView.swift
//  iOS_063_Leejehyeon
//
//  Created by LJh on 2023/07/01.
//

import SwiftUI

struct ResultView: View {
  var body: some View {
    NavigationStack{
      VStack{
        Text("\(Operation.comparePocketmonType(Team1.team1State,Team2.team2State))")
          .font(.largeTitle)
      }
    }.navigationTitle("결과창").font(.largeTitle)
  }
}

struct ResultView_Previews: PreviewProvider {
  static var previews: some View {
    ResultView()
  }
}
