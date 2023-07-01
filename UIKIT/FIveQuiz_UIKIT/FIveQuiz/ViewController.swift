//
//  ViewController.swift
//  FIveQuiz
//
//  Created by LJh on 2023/06/21.
//

import UIKit

class ViewController: UIViewController {

  
  var resultNumbers : [Int] = [0,0,0]
  
  @IBOutlet weak var resultLabel: UILabel!
  
  //뷰가 보이기 전에 처리할 내용을 여기 담아주세요.
  override func viewDidLoad() {
    super.viewDidLoad()
    
    startGame()
    }

  
  @IBAction func pressNumber1Button(_ sender: UIButton) {
    let userNumber = sender.tag
    
  }
  
  @IBAction func pressNumber2Button(_ sender: UIButton) {
    let userNumber = sender.tag
    
  }
  
  
  @IBAction func pressNumber3Button(_ sender: UIButton) {
    let userNumber = sender.tag
    
  }
  /*
  @IBAction func pressNumberButton(_ sender: UIButton) {
    let userNumber = sender.tag
    
    if resultNumber == userNumber {
      resultLabel.text = "맞췄습니다."
    }else if resultNumber > userNumber{
      resultLabel.text = "더 큰 숫자가 필요합니다."
    }else{
      resultLabel.text = "더 작은 숫자가 필요합니다."
    }
  }
  */
  @IBAction func pressResetButton(_ sender: UIButton) {
    startGame()
    
  }
  
  
  func startGame(){
    resultLabel.text = "숫자를 선택하세요."
    
    let resultNumber1 = Int.random(in: 0...10)
    let resultNumber2 = Int.random(in: 0...10)
    let resultNumber3 = Int.random(in: 0...10)
    resultNumbers = [resultNumber1,resultNumber2,resultNumber3]
    
  }
  
}

