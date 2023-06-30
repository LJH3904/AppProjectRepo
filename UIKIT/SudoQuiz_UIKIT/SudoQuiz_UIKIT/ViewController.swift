//
//  ViewController.swift
//  SudoQuiz_UIKIT
//
//  Created by LJh on 2023/06/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  let speechSynth = AVSpeechSynthesizer()

  var quizData: [QuizData] = QuizData.QuizDataArray
  
  var stage : Int = 0
  var score : Int = 0
  var answers : [String] = [""]
  var toggle : Bool = false
  var tryCount : Int  = 3
  @IBOutlet weak var stageText: UILabel!
  @IBOutlet weak var quizText: UILabel!
  @IBOutlet weak var quizImage: UILabel!
  @IBOutlet weak var scoreText: UILabel!
  @IBOutlet var quizButtons: [UIButton]!
  
  @IBOutlet weak var resetButton: UIButton!
  @IBOutlet weak var pressHintVar: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    quizData.shuffle()
    resetButton.isHidden = true
    answers =  quizData[stage].answers.shuffled()
    quizText.text = "다음 나라의 수도는 어디일까요?"
    
  
    quizText.font = UIFont(name: "DungGeunMo", size: 20)
    quizImage.font = quizImage.font.withSize(200)
    quizImage.text = quizData[stage].countryEmoji
    stageText.text = "STAGE \(stage + 1 )"
    scoreText.text = "Score : \(score)"
    
    for i in 0...3{
      quizButtons[i].setTitle("\(i + 1). \(answers[i])", for: .normal)
      quizButtons[i].addTarget(self, action: #selector( pressAnswerButton(_:)), for: .touchUpInside)
      
      quizButtons[i].titleLabel?.font = UIFont.init(name: "DungGeunMo", size: 20)
    }
  }
  
  
  
  func correctIndex() -> Int{
    answers.firstIndex(of: quizData[stage].correctAnswer) ?? 0
  }
 
  @objc func pressAnswerButton(_ sender : UIButton){
   
    let tag = sender.tag
    
     
      if tag == correctIndex(){
        if stage < 9 {
          tryCount = 3
          showAlert(title: "정답입니다.", message: "다음 문제로 가시죠")
          let utterance = AVSpeechUtterance(string: "굳" ?? "error")
          speechSynth.speak(utterance)
          stage += 1
          score += 10
          stageText.text = "STAGE \(stage + 1)"
          scoreText.text = "SCORE \(score)"
          answers = quizData[stage].answers.shuffled()
          
          for i in 0...3{
            quizButtons[i].setTitle("\(i + 1). \(answers[i])", for: .normal)
            quizImage.text = quizData[stage].countryEmoji
          }
        }
        else{
          
          score += 10
          tryCount = 3
          scoreText.text = "SCORE \(score)"
          showAlert(title: "정답입니다.", message: "끝!")
          let utterance = AVSpeechUtterance(string: "축하합니다~! 통과하셨습니다." ?? "error")
          speechSynth.speak(utterance)
          quizImage.font = quizImage.font.withSize(100)
          quizImage.text = "총점수 \n \(score)\u{1F973} "
          
          changeToggle()
        }
      }
        else{
          tryCount -= 1
          showAlert(title: "틀렸습니다", message: "힌트를 확인하세요. \n 남은 기회 : \(tryCount)")
          let utterance = AVSpeechUtterance(string: "어허" ?? "error")
          speechSynth.speak(utterance)
          if tryCount < 1 {
            scoreText.text = "SCORE \(score)"
            showAlert(title: "다시도전하세요.", message: "끝!")
            let utterance = AVSpeechUtterance(string: "병신" ?? "error")
            speechSynth.speak(utterance)
            quizImage.font = quizImage.font.withSize(100)
            quizImage.text = "총점수 \n \(score) 😕"
            changeToggle()
            }
        }
    
    
  }
  
  
  
  @IBAction func pressedResetButton(_ sender: UIButton) {
    changeToggle()
    tryCount = 3
    stage = 0
    score = 0
    viewDidLoad()
  }
  
  //MARK: - Toggle

  func changeToggle(){

    toggle.toggle()
    quizText.isHidden = toggle
    stageText.isHidden = toggle
    scoreText.isHidden = toggle
    for i in 0...3{
      quizButtons[i].isHidden = toggle
    }
    pressHintVar.isHidden = toggle
    resetButton.isHidden = !toggle
    
  }
  //MARK: - alert

  @IBAction func pressHintButton(_ sender: UIButton) {
    let alert = UIAlertController(title: "Hint", message: "\(quizData[stage].countryName) \n *3번 연속 틀리면 리셋*", preferredStyle: .alert)
    let yes = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(yes)
    present(alert, animated: true, completion: nil)
  }
  
  func showAlert(title : String, message : String){
    
    let alert = UIAlertController(title: "\(title)", message: "\(message)", preferredStyle: .alert)
    let yes = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(yes)
    present(alert, animated: true, completion: nil)
    
  }
  
}

