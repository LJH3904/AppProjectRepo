//
//  ShoppingItemStore.swift
//  ShoppingList
//
//  Created by 아라 on 2023/08/04.
//

import Foundation

class ItemStore: ObservableObject {
    var shoppingItems: [Item] = []
    @Published var products : [Item] = []
    @Published var cartItems: [Item] = []
    
    func addItem(item: Item) {
        cartItems.append(item)
    }
    
    func deleteItem(at offsets: IndexSet){
        cartItems.remove(atOffsets: offsets)
    }
  func fetchProducts() {
    products = loadJson("products.json")
  }
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
  func loadJson(_ filename: String) -> [Item] {
    let data: Data
    
    // 프로젝트의 번들 파일들 중에서
    // 해당 이름의 파일이 존재하는지 확인해서
    // 그 파일이 있다면 file이라는 주소 값에 담고
    // 없다면 에러를 발생시키고 중지한다
    guard let file: URL = Bundle.main.url(forResource: filename, withExtension: nil) else {
      fatalError("\(filename) not found.")
    }
    
    // 존재하는 file 주소에 접근해 그 내용을 읽어서 Data 값으로 만든다
    do {
      data = try Data(contentsOf: file)
    } catch {
      fatalError("Could not load \(filename): \(error)")
    }
    
    // 이제 Data 타입의 내용을 JSON이라고 생각해서
    // 원래 우리가 목표로 한 [Product] 타입으로 변환시켜 담아보도록 한다
    do {
      return try JSONDecoder().decode([Item].self, from: data)
    } catch {
      fatalError("Unable to parse \(filename): \(error)")
    }
  }
  
  
}

class ProductStore : ObservableObject{
  
 
  
}
