//
//  Monster.swift
//  Homework
//
//  Created by LJh on 2023/07/17.
//

import Foundation


struct Monster : Identifiable{
  var id =  UUID()
  
  let name : String

  var locationURLString : String
  var locationURL: URL {
    get {
      return URL(string: locationURLString)!
    }
  }
  
  
}
