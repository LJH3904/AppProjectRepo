//
//  Store.swift
//  PublicDataApp
//
//  Created by LJh on 2023/08/08.
//

import Foundation
/*
 struct Product: Codable {
   
     var rowno: String
   
     var id : Int {
     get{
       return self.id
       }
       set(rowno){
         self.id = Int(rowno)
       }
     }
   
     let sellyear: String
     let sellmonth : String
     let seltnstd: Seltnstd
     let prdtnm: String
   
 }

 enum Seltnstd: String, Codable {
     case 금액 = "금액"
     case 수량 = "수량"
 }
 */

class ProductStore :ObservableObject{
  
  @Published var products : [Product] = []

  func fetchProduct () {
    
    products = loadJson("pxlist.json")

  }

  func loadJson(_ filename: String) -> [Product] {
    let data: Data
    guard let file: URL = Bundle.main.url(forResource: filename, withExtension: nil) else {
      fatalError("\(filename) not found.")
    }
    
    do {
      data = try Data(contentsOf: file)
    } catch {
      fatalError("Could not load \(filename): \(error)")
    }
    
    do {
      return try JSONDecoder().decode([Product].self, from: data)
    } catch {
      fatalError("Unable to parse \(filename): \(error)")
    }
  }
  
}
