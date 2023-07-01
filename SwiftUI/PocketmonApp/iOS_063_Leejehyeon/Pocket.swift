//
//  Poketmon.swift
//  iOS_063_Leejehyeon
//
//  Created by LJh on 2023/07/01.
//

import Foundation



struct Team1: Identifiable {
  let id :UUID = UUID()
  let name :String
  let poketArray : [Pocket]
  static var team1State : Int = 0
}

struct Team2: Identifiable {
  let id :UUID = UUID()
  let name :String
  let poketArray : [Pocket]
  static var team2State : Int = 0
}

struct Pocket: Identifiable{
  let id :UUID = UUID()
  let poketmonName : String
  let type : Int
  
}



func changeState(_ n : Int) -> String{
  if n == 1{
    return "💧"
  }else if n == 2{
    return "🔥"
  }else {
    return "🌳"
  }
}


func compareState(_ team1Type : Int, _ team2Type : Int) -> String{
  if team1Type == 1 {
    switch team2Type{
      case 1:
        return "💧과 💧은 비깁니다."
      case 2:
        return "💧은 🔥을 이겨요 팀1 승리"
      default:
        return "💧은 🌳를 이기지 못해요 팀2 승리"
    }
  }else if team1Type == 2{
    switch team2Type{
      case 2:
        return "🔥과 🔥은 비깁니다."
      case 3:
        return "🔥은 🌳을 이겨요 팀1 승리"
      default:
        return "🔥은 💧를 이기지 못해요 팀2 승리"
    }
  }else{ // 3 = 풀 > 물(1)
    switch team2Type{
      case 3:
        return "🌳과 🌳은 비깁니다."
      case 1:
        return "🌳은 💧을 이겨요 팀1 승리"
      default:
        return "🌳은 🔥를 이기지 못해요 팀2 승리"
    }
  }
}

let team1  = Team1(name: "첫째팀", poketArray:
                                  [Pocket(poketmonName: "꼬부기(물)", type: 1),
                                  Pocket(poketmonName: "파이리(불)", type: 2),
                                  Pocket(poketmonName: "치코리타(풀)", type: 3)])

let team2 = Team2(name: "첫째팀", poketArray:
                    [Pocket(poketmonName: "이제현(물)", type: 1),
                    Pocket(poketmonName: "현이제(불)", type: 2),
                    Pocket(poketmonName: "제현이(풀)", type: 3)])

