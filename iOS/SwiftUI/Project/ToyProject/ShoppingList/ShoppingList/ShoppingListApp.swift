//
//  ShoppingListApp.swift
//  ShoppingList
//
//  Created by 아라 on 2023/08/04.
//

import SwiftUI

@main
struct ShoppingListApp: App {
    var body: some Scene {
        WindowGroup {
            let shoppingItemStore = ItemStore()
            ContentView().environmentObject(shoppingItemStore)
        }
    }
}
