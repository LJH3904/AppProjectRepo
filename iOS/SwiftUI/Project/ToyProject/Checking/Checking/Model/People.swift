//
//  People.swift
//  Checking
//
//  Created by LJh on 2023/08/18.
//

import Foundation

enum GoChoiceTime : String , Codable , CaseIterable {
  case five = "오후 5시 탑승"
  case four = "오후 4시 탑승"
  case seven = "오후 7시 탑승"
  case other = "탑승하지 않음 (자차 이용 등, 개인이 알아서 도착)"
}


struct People : Codable , Hashable{
  
  let name : String
  let sex : String
  let birth : String
  let tel : String
  let organization : String
  let Departure : String
}
