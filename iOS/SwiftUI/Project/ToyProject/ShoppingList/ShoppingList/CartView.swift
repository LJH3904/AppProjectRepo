//
//  CartView.swift
//  ShoppingList
//
//  Created by 아라 on 2023/08/04.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var itemStore: ItemStore
  
    @State var url: URL
    @State var isShowingShoppingWeb: Bool = false
    
    var body: some View {
        List {
          ForEach(itemStore.cartItems) { item in
                Button {
                    url = item.shoppingUrl
                    isShowingShoppingWeb = true
                } label: {
                    CartItemView(item: item)
                }
            }
            .onDelete(perform: itemStore.deleteItem)
        }
        .onAppear(){
          itemStore.fetchProducts()
        }
        .listStyle(.inset)
        .sheet(isPresented: $isShowingShoppingWeb) {
            ShoppingWebView(url: $url)
        }
    }
}

struct CartItemView: View {
    let item: Item
    var body: some View {
        HStack {
            AsyncImage(url: item.imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
            } placeholder: {
                ProgressView()
            }
            .border(.gray)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("\(item.shoppingName)")
                        .font(.title2)
                        .padding(.bottom, 5)
                }
                Text("\(item.name)")
                    
                HStack {
                    Spacer()
                    Text("\(item.price)")
                }
                .padding()
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(url: URL(string: "https://naver.com")!).environmentObject(ItemStore())
    }
}
