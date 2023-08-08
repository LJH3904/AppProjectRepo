//
//  ProductDetailView.swift
//  PublicDataApp
//
//  Created by LJh on 2023/08/08.
//

import SwiftUI

struct ProductDetailView: View {
    @ObservedObject var productStore : ProductStore
    @Binding var isSelection : Seltnstd
    
    var productFilter : [Product] {
        get{
            return productStore.products.filter({ $0.seltnstd.rawValue == isSelection.rawValue})
        }
    }
    
    var body: some View {
       VStack{
            ForEach(productFilter, id: \.self) { product in
                Text("\(product.prdtnm)")
            }
        }
        .onAppear(){
            productStore.fetchProduct()
        }
    }
    
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(productStore: ProductStore(), isSelection: .constant(.금액))
    }
}
