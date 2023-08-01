//
//  Number.swift
//  HomeWork3
//
//  Created by LJh on 2023/08/01.
//

import Foundation
import SwiftUI



struct Number : Codable,Identifiable{
  let id : UUID = UUID ()
  let number : Int
  let date : Date
  
}
