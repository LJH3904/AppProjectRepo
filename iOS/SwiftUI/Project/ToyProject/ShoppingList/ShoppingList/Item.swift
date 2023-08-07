//
//  ShoppingItem.swift
//  ShoppingList
//
//  Created by 아라 on 2023/08/04.
//

import Foundation

struct Item :Identifiable , Codable{
    var id : String
    var name: String
    var imageUrlString: String
    var imageUrl: URL {
        URL(string: imageUrlString) ?? URL(string: "https://naver.com")!
    }
    var price: Int
    var shoppingName: String
    var shoppingUrlString: String
    var shoppingUrl: URL {
        URL(string: shoppingUrlString) ?? URL(string: "https://naver.com")!
    }
 
  
}
