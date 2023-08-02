//
//  TimerData.swift
//  TimeAttack
//
//  Created by LJh on 2023/07/25.
//

import Foundation
import Combine


class TimerData : ObservableObject {
  
  var timer : Timer?
  @Published var timeCount : Int = 0
  
  init(){
        
    timer = Timer.scheduledTimer(timeInterval: 1.0,
                    target: self,
                    selector: #selector(timerDidFire),
                    userInfo: nil,
                    repeats: true
                  //Timer? <-의 이유
                  //반복할거냐 말거냐 ? repeats: 가 false 가되면
                  //그 타이머의 작동이 다 된 후에 파괴(fire)되고 스스로 nil 값이 되기에
                  //Timer는 옵셔널 타입을 가져야 한다.
      )
  }
  
  @objc func timerDidFire() {
    timeCount += 1
  }
  
  func resetCount(){
    timeCount = 0
  }
}

