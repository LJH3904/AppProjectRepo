//
//  ResultView.swift
//  iOS_063_Leejehyeon
//
//  Created by LJh on 2023/07/01.
//

import SwiftUI

struct ResultView: View {
  var body: some View {
    //물1 불2 풀3
    ZStack{
      Color(.blue)
      Text("\(compareState(team1State,team2State))")
        .font(.system(size: 50))
        .foregroundColor(.white)
        .bold()
        
    }
  }
  
//  func compareInt(){
//    if team1State == 1 {
//      switch team2State{
//        case 1:
//          return
//        default:
//          <#code#>
//      }
//
//    }
//    //    }else if computerInt == 1{
//    //
//    //      imageString = "rock"
//    //    }else{
//    //
//    //      imageString = "paper"
//    //    }
//    //
//    //    guard computerInt != userInt else{
//    //      changeColor = .red
//    //      return resultString = "무승부"
//    //    }
//    //
//    //    if computerInt == 0 {
//    //      if userInt == 1 {
//    //        changeColor = .green
//    //        resultString = "승리"
//    //
//    //      }else{
//    //        changeColor = .gray
//    //        resultString = "패배"
//    //      }
//    //    }else if computerInt == 1 {
//    //      if userInt == 2 {
//    //        changeColor = .green
//    //        resultString = "승리"
//    //      }else{
//    //        changeColor = .gray
//    //        resultString = "패배"
//    //      }
//    //    }else {
//    //      if userInt == 0 {
//    //        changeColor = .green
//    //        resultString = "승리"
//    //      }else{
//    //        changeColor = .gray
//    //        resultString = "패배"
//    //      }
//  }
}

struct ResultView_Previews: PreviewProvider {
  static var previews: some View {
    ResultView()
  }
}
