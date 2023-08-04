//
//  ShoppingItemDetailView.swift
//  ShoppingList
//
//  Created by 아라 on 2023/08/04.
//

import SwiftUI

struct ItemView: View {
    @EnvironmentObject var itemStore: ItemStore
    @State var isShowingAlert = false
    
    var shoppingItem: Item
    
    var body: some View {
        HStack {
            AsyncImage(url: shoppingItem.imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
            } placeholder: {
                ProgressView()
            }
            .border(.gray)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("\(shoppingItem.shoppingName)")
                        .font(.title2)
                        .padding(.bottom, 5)
                    
                    Spacer()
                    
                    Button {
                        itemStore.addItem(item: shoppingItem)
                        isShowingAlert.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.title)
                    }
                    .alert(isPresented: $isShowingAlert) {
                        Alert(title: Text("장바구니에 추가되었습니당^ㅡ^"))
                    }
                }
                Text("\(shoppingItem.name)")
                    
                HStack {
                    Spacer()
                    Text("\(shoppingItem.price)")
                }
                .padding()
            }
        }
    }
}

struct ShoppingItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(shoppingItem: ItemStore().shoppingItems[0]).environmentObject(ItemStore())
    }
}
