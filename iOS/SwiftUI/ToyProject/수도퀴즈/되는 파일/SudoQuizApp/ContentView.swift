//
//  ContentView.swift
//  SudoQuizApp
//
//  Created by 신희권 on 2023/06/21.
//

import SwiftUI

struct ContentView: View {
  @State var quizData: [QuizData] = QuizData.QuizDataArray //[QuizData1(내용),QuizData2(내용),QuizData3(내용)]
  @State var quizAnswer: [String] = [""]
  @State var resultString : String = ""
  @State var stage: Int = 0
  @State var isCollectAlert: Bool = false
  @State var isWrongAlert: Bool = false
  @State var isHintAlert: Bool = false
  @State var score: Int = 0
  @State var wrongCount: Int = 0
  @State var openedHintCount : Int = 0
  init() {
    _quizAnswer = State(initialValue: quizData[stage].answers.shuffled())
  }
  var body: some View {
    
    ZStack{
      
      Color(red: 5 / 255, green: 9 / 255, blue: 255 / 255).ignoresSafeArea()
      
      
      VStack(spacing: 40) {
        Spacer()
        
        HStack{
          
          Text(" STAGE \(stage + 1)")
            .foregroundColor(.white)
            .font(.custom("DungGeunMo", size: 50))
          
          Spacer()
          Button {
            isHintAlert.toggle()
          } label: {
            Text("Hint ")
              .foregroundColor(.green)
              .font(.custom("DungGeunMo", size: 40))
          }.alert("Hint! \n\n \(quizData[stage].countryName)", isPresented: $isHintAlert) {
            Button {
              openedHintCount += 1
            } label: {
              Text("닫기")
                .foregroundColor( Color(red: 242 / 255, green: 249 / 255, blue: 147 / 255)
                ).font(.custom("DungGeunMo", size: 30))
            }
          }
          
          
          
          
        }
        
        VStack(spacing: 45){
          Text("다음 나라의 수도는?")
            .foregroundColor(.white)
            .font(.custom("DungGeunMo", size: 30))
          
          Text("\(quizData[stage].countryEmoji)")
            .font(.system(size: 200))
            .frame(height: 150)
          
          HStack{
            VStack(alignment: .leading, spacing: 20){
              if wrongCount == 3 || openedHintCount == 3{
               
                Button {
                  resetCount()
                } label: {
                  Text("re?")
                    .foregroundColor( Color(red: 242 / 255, green: 249 / 255, blue: 147 / 255)
                    ).font(.custom("DungGeunMo", size: 30))
                }
                
              }else if score == 100 {
                Text("축하드립니다!")
                  .foregroundColor( Color(red: 242 / 255, green: 249 / 255, blue: 147 / 255)
                  ).font(.custom("DungGeunMo", size: 20))
              }else{
                ForEach(0..<4) { btnIdx in
                  Button {
                    if btnIdx == correctIndex() {
                      isCollectAlert.toggle()
                    } else{
                      isWrongAlert.toggle()
                      
                    }
                    
                  } label: {
                    Text("\(btnIdx + 1). \(quizAnswer[btnIdx])")
                  }.font(.custom("DungGeunMo",size: 25))
                    .foregroundColor(.white)
                    .alert("다시 생각 해 보세요", isPresented: $isWrongAlert) {
                      Button("틀렷어욤 ㅋㅋ") {
                        wrongCount += 1
                      }
                    }
                    .alert("정답입니다.", isPresented: $isCollectAlert) {
                      Button("OK") {
                        nextQuiz()
                        score += 10
                      }
                      
                    }
                  
                  
                } // idx
                Spacer()
              }
              
            }
            Spacer()
            
          }.frame(width: 200)
        }
        
        VStack{
          Text("Score: \(score)")
            .foregroundColor( Color(red: 242 / 255, green: 249 / 255, blue: 147 / 255)
            ).font(.custom("DungGeunMo", size: 30))
          Text("Hint: \(openedHintCount)")
            .foregroundColor( Color(red: 242 / 255, green: 249 / 255, blue: 147 / 255)
            ).font(.custom("DungGeunMo", size: 30))
          Text("Wrong: \(wrongCount)")
            .foregroundColor( Color(red: 242 / 255, green: 249 / 255, blue: 147 / 255)
            ).font(.custom("DungGeunMo", size: 30))
          Spacer()
        }
        
     
      }
      
    }
  }
  
}

extension ContentView {
  func nextQuiz() {
    if stage >= quizData.count - 1{
      resultString = "끝났어요"
    } else{
      
      stage += 1
      shuffleAnswer()
      
    }
  }
  
  func correctIndex() -> Int {
    quizAnswer.firstIndex(of: quizData[stage].correctAnswer) ?? 0
    
  }
  
  func shuffleAnswer() {
    quizAnswer = quizData[stage].answers.shuffled()
  }
  func resetCount() {
    stage = 0
    wrongCount = 0
    score = 0
    openedHintCount = 0
    shuffleAnswer()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
