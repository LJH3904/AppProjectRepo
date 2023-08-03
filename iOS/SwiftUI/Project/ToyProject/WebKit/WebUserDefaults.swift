//
//  WebUserDefaults.swift
//  Lab13
//
//  Created by LJh on 2023/08/03.
//

import Foundation

struct WebUserDefaults {
  
  func fetchStickers() {
    // UserDefaults의 데이터를 가져오는 국룰 코드
    do {
      // UserDefaults에서 "Stickers"라는 key의 값을 가져오는데
      // 이 value는 어떤 타입인지를 따로 알려주니는 않는다
      // JSON을 인코딩해서 Data 만들어 저장한거니까
      // 우리는 미리 이것이 Data 타입이라고 생각하고
      // 형 변환 (as? Data)과 관련된 if let 옵셔널 바인딩 처리로
      // 올바르게 Data 타입의 data 인스턴스가 잡혔을때만 관련 처리를 진행한다
      if let data = UserDefaults.standard.object(forKey: "Stickers") as? Data {
        let decoder: JSONDecoder = JSONDecoder()
        stickers = try decoder.decode([Sticker].self, from: data)
      }
    } catch {
      print("UserDefaults로 부터 데이터 가져오기 실패")
    }
  }
  user
}
