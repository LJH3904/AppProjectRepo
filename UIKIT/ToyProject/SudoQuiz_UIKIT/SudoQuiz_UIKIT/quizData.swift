//
//  quizData.swift
//  SudoQuiz_UIKIT
//
//  Created by LJh on 2023/06/21.
//

import Foundation


struct QuizData{
    let countryName: String
    let countryEmoji: String
    let correctAnswer: String
    var wrongAnswers: [String] {
        get {
            let list: [String] = wrongList.shuffled()
           
            return [list[0]] + [list[1]] + [list[2]]
            
        }
    }
    var answers: [String] {
        get {
            let tempAnswers : [String] = wrongAnswers + [correctAnswer]
            return tempAnswers
        }
    }
    
    
    
    
    let wrongList: [String] = [
    "부산","교토","삿포로","후쿠오카","벤쿠버","시드니","멜버른","시카고","밀라노","프랑크푸르트", "상파울루", "샌프란시스코", "홍콩", "뉴욕", "이스탄불", "베니스", "취리히", "야즈드" , "살라망카"
    ]

}

extension QuizData{
    static let QuizDataArray: [QuizData] = [
        QuizData(countryName: "일본", countryEmoji: "\u{1F1EF}\u{1F1F5}", correctAnswer: "도쿄" ),
        QuizData(countryName: "중국", countryEmoji: "\u{1F1E8}\u{1F1F3}", correctAnswer: "베이징" ),
        QuizData(countryName: "쿠웨이트", countryEmoji: "\u{1F1F0}\u{1F1FC}", correctAnswer: "쿠웨이트" ),
        QuizData(countryName: "캄보디아", countryEmoji: "\u{1F1F0}\u{1F1ED}", correctAnswer: "프놈펜" ),
        QuizData(countryName: "말레이시아", countryEmoji: "\u{1F1F2}\u{1F1FE}", correctAnswer: "쿠알라룸푸르" ),
        QuizData(countryName: "미얀마", countryEmoji: "\u{1F1F2}\u{1F1F2}", correctAnswer: "양곤" ),
        QuizData(countryName: "부탄", countryEmoji: "\u{1F1E7}\u{1F1F9}", correctAnswer: "팀부" ),
        QuizData(countryName: "이라크", countryEmoji: "\u{1F1EE}\u{1F1F6}", correctAnswer: "바그다드" ),
        QuizData(countryName: "오만", countryEmoji: "\u{1F1F4}\u{1F1F2}", correctAnswer: "무스카스" ),
        QuizData(countryName: "대한민국", countryEmoji: "\u{1F1F0}\u{1F1F7}", correctAnswer: "서울" )
     ]
}
