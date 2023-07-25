//
//  Data.swift
//  NbbangAPP
//
//  Created by LJh on 2023/07/25.
//

import Foundation

class Data : ObservableObject {
  @Published var totalMoney : Int
  init(totalMoney: Int = 0) {
    self.totalMoney = totalMoney
  }
}
