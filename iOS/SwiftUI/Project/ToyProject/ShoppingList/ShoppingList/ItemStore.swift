//
//  ShoppingItemStore.swift
//  ShoppingList
//
//  Created by 아라 on 2023/08/04.
//

import Foundation

class ItemStore: ObservableObject {
    var shoppingItems: [Item] = []
    @Published var cartItems: [Item] = []
    
    init() {
        shoppingItems = [
            Item(name: "삼성전자 갤럭시 Z 플립5 5G 자급제 SM-F731N", imageUrlString: "https://images.samsung.com/kdp/event/sec/2023/0801_galaxy_flip5/preorder/buying/slide/flip5_buying_default01_pc.png", price: 1289000, shoppingName: "Coupang", shoppingUrlString: "https://www.coupang.com/vp/products/7410157624?itemId=19197972081&vendorItemId=86315402641&q=%ED%95%B8%EB%93%9C%ED%8F%B0&itemsCount=36&searchId=cc5372605ae348519b0819e0682c0bf0&rank=0&isAddedCart="),
            Item(name: "에어팟 맥스", imageUrlString: "data:image/jpeg;base64,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", price: 769000, shoppingName: "Apple", shoppingUrlString: "https://www.apple.com/kr/shop/buy-airpods/airpods-max"),
            Item(name: "Mac Studio", imageUrlString: "https://www.apple.com/v/mac-studio/f/images/overview/hero/static_front__fmvxob6uyxiu_large.jpg", price: 2990000, shoppingName: "Apple", shoppingUrlString: "https://www.apple.com/kr/mac-studio/")
        ]
    }

    func addItem(item: Item) {
        cartItems.append(item)
    }
    
    func deleteItem(at offsets: IndexSet){
        cartItems.remove(atOffsets: offsets)
    }
}

