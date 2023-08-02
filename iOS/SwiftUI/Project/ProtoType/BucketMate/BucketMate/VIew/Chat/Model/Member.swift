//
//  Member.swift
//  BucketMate
//
//  Created by LJh on 2023/07/27.
//

import Foundation

struct Member: Identifiable{
  let id : UUID = UUID()
  let name : String
  var image : String
}
