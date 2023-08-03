//
//  Web.swift
//  Lab13
//
//  Created by LJh on 2023/08/03.
//

import Foundation

struct Web : Identifiable, Codable{
  let id : UUID = UUID()
  let title : String
  let urlString : String
  let imageString : String
}
