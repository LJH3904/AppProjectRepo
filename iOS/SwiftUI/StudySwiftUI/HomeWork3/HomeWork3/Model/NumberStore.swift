//
//  NumberStore.swift
//  HomeWork3
//
//  Created by LJh on 2023/08/01.
//

import Foundation

class NumberStore : ObservableObject {
  @Published var numberStore : [Number] = []
  
//  init(){
//    numberStore  = []
//  }
  
  //MARK: - 가져오기

  func fetchNumbers() {
    print("fetch")
      do {
          if let data = UserDefaults.standard.object(forKey: "Numbers") as? Data {
              let decoder: JSONDecoder = JSONDecoder()
            numberStore = try decoder.decode([Number].self, from: data)
          }
      } catch {
          print("UserDefaults로 부터 데이터 가져오기 실패")
      }
  }
  //MARK: - 저장하기

    func saveNumbers() {
      print("save")
        do {
            let endcoder: JSONEncoder = JSONEncoder()
            let data: Data = try endcoder.encode(numberStore)

            UserDefaults.standard.set(data, forKey: "Numbers")
        } catch {
            print("JSON 생성 후 UserDefaults 실패")
        }
  }
  //MARK: - addNumbers()
  
  func addNumbers(n : Int , date : Date){
    numberStore.append(Number(number: n, date: date))
    print("addn")
  }
  
  
}
