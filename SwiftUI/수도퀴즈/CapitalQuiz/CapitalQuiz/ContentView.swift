//
//  ContentView.swift
//  CapitalQuiz
//
//  Created by LJh on 2023/06/21.
//

import SwiftUI

struct ContentView: View {
  @State var quizData : [QuizData] = QuizData.QuizDataArray
  //바로 가져오는것
  @State var quizAnswer : [String] = [""]
  
  //MARK: - contentViewStateVar

  @State var stage : Int = 0
  @State var score : Int = 0
  @State var openedHintCount : Int = 0
  @State var wrongCount : Int = 0
  
  //MARK: - isAlert

  @State  var isCollectAlert :Bool = false
  @State var isWrongAlert : Bool = false
  @State var isHintAlert : Bool = false
  
  
  init(){
    _quizAnswer = State(initialValue: quizData[stage].answers.shuffled())
  }
  
  
  var body: some View {
    
    
    ZStack{
      
      Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255).ignoresSafeArea()
      
      
      VStack(spacing: 30) {
        HStack{
          Text("STAGE \(stage + 1)")
            .foregroundColor(.white)
            .font(.custom("DungGeunMo", size: 40))
          Spacer()
          Button {
            
            isHintAlert.toggle()
          } label: {
            Image(systemName:"figure.highintensity.intervaltraining")
            Text("HINT")
          }.foregroundColor(.white)
            .font(.custom("DungGeunMo", size: 20))
            .alert(quizData[stage].countryName, isPresented: $isHintAlert) {
              Button {
                openedHintCount += 1
              } label: {
                Text("닫기")
              }
            }
        }.padding()
        
        VStack(alignment: .leading){
          Text("다음 나라의 수도는 \n어디일까요?")
            .foregroundColor(.white)
            .font(.custom("DungGeunMo", size: 30))
            
        }
          Text("\(quizData[stage].countryEmoji)")
            .font(.system(size: 130))
        
        VStack(alignment: .leading,spacing: 10){
          if wrongCount == 3 || openedHintCount == 3{
          Text("아쉽게도 탈락")
            .foregroundColor(.white)
            .font(.system(size: 30))
            Button {
              resetCount()
            } label: {
              Text("re?")
                .foregroundColor(.white)
                .font(.system(size: 30))
            }

          }else{
            VStack(){
            ForEach(0..<4){ idx in
              Text("---------------------")
                .foregroundColor(.white)
              Button {
                if checkQuiz() == idx {
                  isCollectAlert.toggle()
                }else{
                  isWrongAlert.toggle()
                }
              } label: {
                Text("\(idx + 1). \(quizAnswer[idx])")
              }.foregroundColor(.white)
                .font(.system(size: 20))
                .alert("다시 생각 해 보세요", isPresented: $isWrongAlert) {
                  Button {
                    wrongCount += 1
                  } label: {
                    Text("틀렸어욤 ㅋㅋ")
                  }
                  
                }
                .alert("정답입니다.", isPresented: $isCollectAlert) {
                  Button("OK") {
                    nextQuiz()
                    score += 10
                  }
                }
              
            }
              Text("---------------------")
          }
          }
        }//버튼 vstack
       
        VStack(alignment: .leading){
          
            Text("\(Image(systemName: "plus")) score : \(score)")
              .foregroundColor(.white)
              .font(.system(size: 30))
            Text("\(Image(systemName: "lock.open")) Opened Hint : \(openedHintCount)")
              .foregroundColor(.white)
              .font(.system(size: 30))
            Text("\(Image(systemName: "lock.rotation.open")) Wrong : \(wrongCount)")
              .foregroundColor(.white)
              .font(.system(size: 30))
          
        }
      }
      
    }//zstack
  }
  
  func checkQuiz() -> Int{
    quizAnswer.firstIndex(of: quizData[stage].correctAnswer) ?? 0
    
  }
  func resetCount(){
    stage = 0
    wrongCount = 0
    score = 0
    openedHintCount = 0
    shuffleAnswer()
  }
  func nextQuiz() {
    if stage >= quizData.count - 1{
      
    }else{
      stage += 1
      shuffleAnswer()
    }
  }
  
   func shuffleAnswer() {
     quizAnswer = quizData[stage].answers.shuffled()
   }
}



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
