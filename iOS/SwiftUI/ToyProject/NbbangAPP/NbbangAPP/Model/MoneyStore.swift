//
//  MoneyStore.swift
//  NbbangAPP
//
//  Created by LJh on 2023/07/25.
//

import Foundation

class MoneyStore : ObservableObject{
  @Published var moneyData : MoneyData = MoneyData(money: "10000")
  @Published var showingMoney : Double = 0.0
  func divideMoneyToTen (money : String){
    let comvertStringToIntMoney = Double(money)!
    showingMoney = Double( comvertStringToIntMoney / 100)
  }
  func divideMoneyTotwenty (money : String){
    let comvertStringToIntMoney = Double(money)!
    showingMoney = Double( comvertStringToIntMoney / 200)
  }
}
