//
//  ChatModel.swift
//  BucketMate
//
//  Created by LJh on 2023/07/27.
//
// 테스트니깐 ~
import Foundation
import SwiftUI

struct ChatModel: Identifiable{
  let id : UUID = UUID()
  let name : String
  var image : String
}

class ChatStore : ObservableObject{
  @Published var chatStore : [ChatModel] = []
  init(){
    chatStore = [
      ChatModel(name: "마경미", image:"MGM"),
      ChatModel(name: "이제현", image:"LJH"),
      ChatModel(name: "김건섭", image:"KKS"),
      ChatModel(name: "박믿음", image:"BMY"),
      ChatModel(name: "유하은", image:"YHY"),
      ChatModel(name: "봉주헌", image:"BJH"),  
    ]
  }
}
