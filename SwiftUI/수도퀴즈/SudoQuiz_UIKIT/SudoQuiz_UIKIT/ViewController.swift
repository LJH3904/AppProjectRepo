//
//  ViewController.swift
//  SudoQuiz_UIKIT
//
//  Created by LJh on 2023/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    var quizData: [QuizData] = QuizData.QuizDataArray
    
    var stage : Int = 0
    var score : Int = 0
    var answers : [String] = [""]
    
    @IBOutlet weak var stageText: UILabel!
    @IBOutlet weak var quizText: UILabel!
    @IBOutlet weak var quizImage: UILabel!
    @IBOutlet weak var scoreText: UILabel!
    @IBOutlet var quizButtons: [UIButton]!
    
    /*
     음성으로 문제 읽어주기
     3대 연석 틀리면 꽝 처음부터 다시 강제 리셋
     */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answers =  quizData[stage].answers.shuffled()
        quizText.text = "다음 나라의 수도는 어디일까요?"
        quizText.font = UIFont(name: "DungGeunMo.otf", size: 20)
        
        quizImage.text = quizData[stage].countryEmoji
        stageText.text = "STAGE \(stage + 1 )"
        scoreText.text = "Score : \(score)"
        
        for i in 0...3{
            quizButtons[i].setTitle("\(i + 1). \(answers[i])", for: .normal)
            quizButtons[i].addTarget(self, action: #selector( buttonAction(_:)), for: .touchUpInside)
            
            quizButtons[i].titleLabel?.font = UIFont.init(name: "DungGeunMo", size: 40)
            
            
            
            
            
        }
    }
    
    @IBAction func pressHintButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Hint", message: "\(quizData[stage].countryName)", preferredStyle: .alert)
        let yes = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(yes)
        present(alert, animated: true, completion: nil)
    }
    
    func correctIndex() -> Int{
        answers.firstIndex(of: quizData[stage].correctAnswer) ?? 0
    }
    //pressAnswerButton()
    @objc func buttonAction(_ sender : UIButton){
        let tag = sender.tag
        
        if stage < 9  {
            if tag == correctIndex() {
                showAlert(title: "정답입니다.", message: "다음 문제로 가시죠")
                stage += 1
                score += 10
                stageText.text = "STAGE \(stage + 1)"
                scoreText.text = "SCORE \(score)"
                answers =  quizData[stage].answers.shuffled()
                
                for i in 0...3{
                    quizButtons[i].setTitle("\(i + 1). \(answers[i])", for: .normal)
                    quizImage.text = quizData[stage].countryEmoji
                }
                
                
            }else{
                showAlert(title: "틀렸습니다", message: "힌트를 확인하세요.")
            }
        }else{
            if let text = sender.titleLabel?.text {
                if quizData[stage].correctAnswer == text {
                    score += 10
                    scoreText.text = "SCORE \(score)"
                }
            }
        }
    }
    func showAlert(title : String, message : String){
        
        let alert = UIAlertController(title: "\(title)", message: "\(message)", preferredStyle: .alert)
        let yes = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(yes)
        present(alert, animated: true, completion: nil)
        
    }
}

