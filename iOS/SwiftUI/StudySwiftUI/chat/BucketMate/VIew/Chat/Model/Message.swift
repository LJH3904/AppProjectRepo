//
//  Message.swift
//  BucketMate
//
//  Created by LJh on 2023/07/27.
//

import Foundation

struct Message : Identifiable{
  var id : UUID = UUID()
  var text : String
  var received : Bool
  var timestamp : Date
}
