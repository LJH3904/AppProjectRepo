//
//  ContentView.swift
//  ShoppingList
//
//  Created by 아라 on 2023/08/04.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var shoppingItemStore: ItemStore
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(shoppingItemStore.shoppingItems) { item in
                        ItemView(shoppingItem: item)
                    }
                }
            }
            .listStyle(.plain)
            .padding()
            .navigationTitle("상품 목록")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        CartView(url: URL(string: "https://naver.com")!)
                    } label: {
                        Image(systemName: "cart")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ItemStore())
    }
}
