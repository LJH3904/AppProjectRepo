//
//  HashTag.swift
//  BucketMate
//
//  Created by LJh on 2023/07/28.
//

import Foundation
import SwiftUI

extension Color {
  static let grayLight = Color("ColorGrayLight")
  static let grayMedium = Color("ColorGrayMedium")
  static let greenDark = Color("ColorGreenDark")
  static let greenLight = Color("ColorGreenLight")
  static let greenMedium = Color("ColorGreenMedium")
  static let indigoMedium = Color("ColorIndigoMedium")
  static let salmonLight = Color("ColorSalmonLight")
}

struct HashTag : Identifiable{
  let id : UUID = UUID()
  let hashTag : String
  let hashTagColors : Color
}
class HashTagStore : ObservableObject {
  @Published var hashTagStore : [HashTag] = []
  init(){
    hashTagStore = [
      HashTag(hashTag: "스카이다이빙", hashTagColors: Color.grayLight),
      HashTag(hashTag: "해저탐험", hashTagColors: Color.grayMedium),
      HashTag(hashTag: "오지여행", hashTagColors: Color.greenDark),
      HashTag(hashTag: "한달살기", hashTagColors: Color.greenLight),
      HashTag(hashTag: "두달살기", hashTagColors: Color.greenMedium),
      HashTag(hashTag: "다이빙스카이", hashTagColors: Color.indigoMedium),
      HashTag(hashTag: "여행가고싶다", hashTagColors: Color.salmonLight),
    ]
  }
}
