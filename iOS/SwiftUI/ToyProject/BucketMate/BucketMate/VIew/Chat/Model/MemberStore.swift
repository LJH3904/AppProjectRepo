//
//  MemberStore.swift
//  BucketMate
//
//  Created by LJh on 2023/07/27.
//

import Foundation

class MemberStore : ObservableObject{
  @Published var memberStore : [Member] = []
  init(){
    memberStore = [
      Member(name: "마경미", image:"MGM"),
      Member(name: "이제현", image:"LJH"),
      Member(name: "김건섭", image:"KKS"),
      Member(name: "박믿음", image:"BMY"),
      Member(name: "유하은", image:"YHY"),
      Member(name: "봉주헌", image:"BJH"),
    ]
  }
}
