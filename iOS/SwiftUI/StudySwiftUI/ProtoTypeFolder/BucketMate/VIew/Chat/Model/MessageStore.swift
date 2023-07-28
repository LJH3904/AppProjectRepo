//
//  MessageStore.swift
//  BucketMate
//
//  Created by LJh on 2023/07/27.
//

import Foundation

class MessageStore : ObservableObject {
  
  @Published var messageStore : [Message] = []
  init(){
    messageStore = [Message( text: "안녕하세요", received: true, timestamp: Date()),
    Message( text: "혹시 도쿄로 여행을 가시나요?", received: true, timestamp: Date()),
    Message( text: "계획이 맘에 들어서 그런데 동참해도 될까요??", received: true, timestamp: Date())]
  }
  func insertMessage(_ msg : String){
    messageStore.append(Message( text: msg, received: false, timestamp: Date()))
  }
}
