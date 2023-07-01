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

var shuffledPocketmonArray:  [Pocket]   {
  get {
    let pocketmonList = team1.poketArray.shuffled()
    return [pocketmonList[0]] + [pocketmonList[1]] + [pocketmonList[2]]
  }
}

struct Pocket: Identifiable{
  let id :UUID = UUID()
  let poketmonName : String
  
  let type : Int
  var locationURLString : String
  var locationURL: URL {
    get {
      return URL(string: locationURLString)!
    }
  }
  
}

struct Operation{
  // 1 = 💧 2 = 🔥 3 = 🌳
  static func changePocketmonType(_ n : Int) -> String{
    if n == 1{
      return "💧"
    }else if n == 2{
      return "🔥"
    }else {
      return "🌳"
    }
  }
  static func comparePocketmonType(_ team1Type : Int, _ team2Type : Int) -> String{
    if team1Type == 1 {
      switch team2Type{
        case 1:
          return "💧 과 💧 은 비깁니다.\n        무승부"
        case 2:
          return "💧 은 🔥 을 이겨요.\n        팀1 승리"
        default:
          return "💧 은 🌳 를 이기지 못해요.\n        팀2 승리"
      }
    }else if team1Type == 2{
      switch team2Type{
        case 2:
          return "🔥 과 🔥 은 비깁니다.\n        무승부"
        case 3:
          return "🔥 은 🌳 를 이겨요.\n        팀1 승리"
        default:
          return "🔥 은 💧 을 이기지 못해요.\n        팀2 승리"
      }
    }else{
      switch team2Type{
        case 3:
          return "🌳 와 🌳 는 비깁니다.\n        무승부"
        case 1:
          return "🌳 는 💧 을 이겨요.\n        팀1 승리"
        default:
          return "🌳 는 🔥 를 이기지 못해요.\n        팀2 승리"
      }
    }
  }
  
}
//MARK: - 포켓몬 초기화
let team1  = Team1(name: "Team1", poketArray:
                    //MARK: - 팀1 물 포켓몬
                   [Pocket(poketmonName: "물짱이", type: 1,locationURLString: String("https://i.namu.wiki/i/DJvWsCObCqoDY-GDE2HsnFQgbmQ8eTF1Sq2yx6-up11zgXh84TY8MZidcPGdfA7OO26IoQom67gmDfQ8T4CFyA.webp")),
                    Pocket(poketmonName: "늪짱이", type: 1,locationURLString: String("https://i.namu.wiki/i/4DPNlRkUQK-hn0-sxbHyMEMfvowgQRA-FtaTO1aU9owfRZ_HqxhxCI9r1teioz95_1SSNuQxN1eH4CIZY_im4A.webp")),
                    Pocket(poketmonName: "대짱이", type: 1,locationURLString: String("https://i.namu.wiki/i/ze6WVlcZki5egnMUXzVp0rJDIGWoA3s40MxTOLYw8kK0f2KZbkLu6fveTL3ZDM97It9XnOgpnVQA-mIIefbp9A.webp")),
                    //MARK: - 팀1 불 포켓몬
                    
                    Pocket( poketmonName: "파이리", type: 2,locationURLString: String("https://i.namu.wiki/i/pkxtZrl-YfBed6iwbxTQh4Eo0B7Wpf9cVfM20UB3ANHsAkZuN80Ap4USIcrRDsdKUAhwxvLSNfvhrTxyYgn9sA.webp")),
                    Pocket( poketmonName: "리자드", type: 2,locationURLString: String("https://i.namu.wiki/i/KJXPNRElmqVNfk4V8Nu8SaxMf4biUf8K5y8wJHDGsHwHGzFvfNGuS8izh-jU2kbPlYdXrEK2wDFCWdv5sS08vg.webp")),
                    Pocket( poketmonName: "리자몽", type: 2,locationURLString: String("https://i.namu.wiki/i/faRFeNbA7E87z0IkdwUsrUxsW_ymvXPu3kdZca2QyJcp30y32y1YyMpdR3oQ2Qabm7f2vyN45s9bSJ7_VH5P5g.webp")),
                    //MARK: - 팀1 풀 포켓몬
                    
                    Pocket( poketmonName: "우츠동", type: 3,locationURLString: String("https://i.namu.wiki/i/dHSAfEMCvKfVT3PvI4qIapWLuVVqoWSz2TPJE_UYDisPoAkh65o7tbRpbdmi9xcBoKG2XIMDqq6G5jHjS67Gwg.webp")),
                    Pocket( poketmonName: "이상해풀", type: 3,locationURLString: String("https://i.namu.wiki/i/vW89P2uDl7ygaldxHgGDJZXDCX-2VwLgTpJrKvua6UijxTbFoxWhT9Z2KjcBtIuqoepqj14vuLhG14cwynlofg.webp")),
                    Pocket( poketmonName: "이상해풀", type: 3,locationURLString: String("https://i.namu.wiki/i/8qDi959j13MEc9QtaOBUEtQJiUaOWL9fTF5cXOA7rcB4od2XW31yTXkrtDxOSVs9DDz1_Rp7EZ4OxZx3U4_qDQ.webp")),
                    //MARK: - 팀2 물 포켓몬
                    
                    Pocket(poketmonName: "연꽃몬", type: 1,locationURLString: String("https://i.namu.wiki/i/FGak2av13hQdHKyuqjYZPWj9uAQsDV2CamX6QGneHuPzZOSxH7O-HdeU4XBvNuJKE6dOBGYu_CgDnELuSwiGoQ.webp")),
                    Pocket(poketmonName: "로토스", type: 1,locationURLString: String("https://i.namu.wiki/i/QX1Q0Fo6pbbvfooAPPVry62Lll2V_hh950Ev2X-urX8eGQ29TRcICegzHM3a9HXZahbfAjDuZ2fww6dVAFKc4w.webp")),
                    Pocket(poketmonName: "로파파", type: 1,locationURLString: String("https://i.namu.wiki/i/ldhWN5SJMlK1fdIGgJfos6UafhycuHLw_HDtDAKCvIG7hYUfuvPcqMBTODAv2u2W5CW_lkNWkGGad2_0Sdyviw.webp")),
                    //MARK: - 팀2 불 포켓몬
                    
                    Pocket( poketmonName: "브케인", type: 2,locationURLString: String("https://i.namu.wiki/i/eVmDLz8r1NsK6blGbViIOkiEnFsvX-xVfSj8WJCsLIjLzFCft2OZbQhyf7TTR63NkoB2f9cqqK62KNLU9hgq8A.png")),
                    Pocket( poketmonName: "마그케인", type: 2,locationURLString: String("https://i.namu.wiki/i/LHW-ELGHhw5BB9nj9x8YG-cfZQUrumM_Sh8YC1KLW2osUKNY2whZr5JgcHm4gn0Ge3592_4dtxAtoeKxrVKxRw.png")),
                    Pocket( poketmonName: "블레이범", type: 2,locationURLString: String("https://i.namu.wiki/i/fIv6r1eJ1TseIklRMWsw6kk6uHNDyKq6ryrAfzDJXexkJz7Y3Rylajxghu9rsF3g6RHFUeIlJfCAsx58RVr1Iw.webp")),
                    //MARK: - 팀2 풀 포켓몬
                    
                    Pocket( poketmonName: "모다피", type: 3,locationURLString: String("https://i.namu.wiki/i/AGYQWyrL6pwsvVo0Jd-XJ5Of5RR2cCjG8Pms1-CWiYeQzOTOwGBjprydeVGkLR_QNHM2JbLBjUBpGqV2tK6hJw.webp")),
                    Pocket( poketmonName: "우츠동", type: 3,locationURLString: String("https://i.namu.wiki/i/dHSAfEMCvKfVT3PvI4qIapWLuVVqoWSz2TPJE_UYDisPoAkh65o7tbRpbdmi9xcBoKG2XIMDqq6G5jHjS67Gwg.webp")),
                    Pocket( poketmonName: "우츠보트", type: 3,locationURLString: String("https://i.namu.wiki/i/ZfpdhsMl8PhNkuHvVuoYfbz1u41-unO7ZdIlZX9pJyPHQX9bghkB2fnX1NmkmeE2Nl5mlHUlaDsSVVR4S9Us-w.webp")),
                    
                   ])

let team2 = Team2(name: "Team2", poketArray:
                    //MARK: - 팀2 물 포켓몬
                  
                  [Pocket(poketmonName: "연꽃몬", type: 1,locationURLString: String("https://i.namu.wiki/i/FGak2av13hQdHKyuqjYZPWj9uAQsDV2CamX6QGneHuPzZOSxH7O-HdeU4XBvNuJKE6dOBGYu_CgDnELuSwiGoQ.webp")),
                   Pocket(poketmonName: "로토스", type: 1,locationURLString: String("https://i.namu.wiki/i/QX1Q0Fo6pbbvfooAPPVry62Lll2V_hh950Ev2X-urX8eGQ29TRcICegzHM3a9HXZahbfAjDuZ2fww6dVAFKc4w.webp")),
                   Pocket(poketmonName: "로파파", type: 1,locationURLString: String("https://i.namu.wiki/i/ldhWN5SJMlK1fdIGgJfos6UafhycuHLw_HDtDAKCvIG7hYUfuvPcqMBTODAv2u2W5CW_lkNWkGGad2_0Sdyviw.webp")),
                   //MARK: - 팀2 불 포켓몬
                   
                   Pocket( poketmonName: "브케인", type: 2,locationURLString: String("https://i.namu.wiki/i/eVmDLz8r1NsK6blGbViIOkiEnFsvX-xVfSj8WJCsLIjLzFCft2OZbQhyf7TTR63NkoB2f9cqqK62KNLU9hgq8A.png")),
                   Pocket( poketmonName: "마그케인", type: 2,locationURLString: String("https://i.namu.wiki/i/LHW-ELGHhw5BB9nj9x8YG-cfZQUrumM_Sh8YC1KLW2osUKNY2whZr5JgcHm4gn0Ge3592_4dtxAtoeKxrVKxRw.png")),
                   Pocket( poketmonName: "블레이범", type: 2,locationURLString: String("https://i.namu.wiki/i/fIv6r1eJ1TseIklRMWsw6kk6uHNDyKq6ryrAfzDJXexkJz7Y3Rylajxghu9rsF3g6RHFUeIlJfCAsx58RVr1Iw.webp")),
                   //MARK: - 팀2 풀 포켓몬
                   
                   Pocket( poketmonName: "모다피", type: 3,locationURLString: String("https://i.namu.wiki/i/AGYQWyrL6pwsvVo0Jd-XJ5Of5RR2cCjG8Pms1-CWiYeQzOTOwGBjprydeVGkLR_QNHM2JbLBjUBpGqV2tK6hJw.webp")),
                   Pocket( poketmonName: "우츠동", type: 3,locationURLString: String("https://i.namu.wiki/i/dHSAfEMCvKfVT3PvI4qIapWLuVVqoWSz2TPJE_UYDisPoAkh65o7tbRpbdmi9xcBoKG2XIMDqq6G5jHjS67Gwg.webp")),
                   Pocket( poketmonName: "우츠보트", type: 3,locationURLString: String("https://i.namu.wiki/i/ZfpdhsMl8PhNkuHvVuoYfbz1u41-unO7ZdIlZX9pJyPHQX9bghkB2fnX1NmkmeE2Nl5mlHUlaDsSVVR4S9Us-w.webp")),
                   Pocket(poketmonName: "물짱이", type: 1,locationURLString: String("https://i.namu.wiki/i/DJvWsCObCqoDY-GDE2HsnFQgbmQ8eTF1Sq2yx6-up11zgXh84TY8MZidcPGdfA7OO26IoQom67gmDfQ8T4CFyA.webp")),
                   Pocket(poketmonName: "늪짱이", type: 1,locationURLString: String("https://i.namu.wiki/i/4DPNlRkUQK-hn0-sxbHyMEMfvowgQRA-FtaTO1aU9owfRZ_HqxhxCI9r1teioz95_1SSNuQxN1eH4CIZY_im4A.webp")),
                   Pocket(poketmonName: "대짱이", type: 1,locationURLString: String("https://i.namu.wiki/i/ze6WVlcZki5egnMUXzVp0rJDIGWoA3s40MxTOLYw8kK0f2KZbkLu6fveTL3ZDM97It9XnOgpnVQA-mIIefbp9A.webp")),
                   //MARK: - 팀1 불 포켓몬
                   
                   Pocket( poketmonName: "파이리", type: 2,locationURLString: String("https://i.namu.wiki/i/pkxtZrl-YfBed6iwbxTQh4Eo0B7Wpf9cVfM20UB3ANHsAkZuN80Ap4USIcrRDsdKUAhwxvLSNfvhrTxyYgn9sA.webp")),
                   Pocket( poketmonName: "리자드", type: 2,locationURLString: String("https://i.namu.wiki/i/KJXPNRElmqVNfk4V8Nu8SaxMf4biUf8K5y8wJHDGsHwHGzFvfNGuS8izh-jU2kbPlYdXrEK2wDFCWdv5sS08vg.webp")),
                   Pocket( poketmonName: "리자몽", type: 2,locationURLString: String("https://i.namu.wiki/i/faRFeNbA7E87z0IkdwUsrUxsW_ymvXPu3kdZca2QyJcp30y32y1YyMpdR3oQ2Qabm7f2vyN45s9bSJ7_VH5P5g.webp")),
                   //MARK: - 팀1 풀 포켓몬
                   
                   Pocket( poketmonName: "우츠동", type: 3,locationURLString: String("https://i.namu.wiki/i/dHSAfEMCvKfVT3PvI4qIapWLuVVqoWSz2TPJE_UYDisPoAkh65o7tbRpbdmi9xcBoKG2XIMDqq6G5jHjS67Gwg.webp")),
                   Pocket( poketmonName: "이상해풀", type: 3,locationURLString: String("https://i.namu.wiki/i/vW89P2uDl7ygaldxHgGDJZXDCX-2VwLgTpJrKvua6UijxTbFoxWhT9Z2KjcBtIuqoepqj14vuLhG14cwynlofg.webp")),
                   Pocket( poketmonName: "이상해풀", type: 3,locationURLString: String("https://i.namu.wiki/i/8qDi959j13MEc9QtaOBUEtQJiUaOWL9fTF5cXOA7rcB4od2XW31yTXkrtDxOSVs9DDz1_Rp7EZ4OxZx3U4_qDQ.webp")),
                  ])

