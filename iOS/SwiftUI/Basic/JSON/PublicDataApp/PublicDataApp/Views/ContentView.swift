//
//  ContentView.swift
//  PublicDataApp
//
//  Created by LJh on 2023/08/08.
//

import SwiftUI

/*
 날씨 , 애완동물 , 미세먼지 ,
 */
struct ContentView: View {
  @ObservedObject var productStore : ProductStore = ProductStore()
  @State var isSelection : Seltnstd = .금액

  var body: some View {
    
    NavigationStack {
    
      VStack(){
        Image("Logo")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 100,height: 100)
        
        Picker("Category", selection: $isSelection) {
          ForEach( Seltnstd.allCases, id: \.self) { category in
            Text("\(category.rawValue)")
              .tag("\(category.rawValue)")
          }
        }.pickerStyle(.segmented)
          .padding()
        
        ScrollView{
            ProductDetailView(productStore: productStore, isSelection: $isSelection)
        }
        Spacer()
      }
      .navigationTitle("List")
      .onAppear{
        productStore.fetchProduct()
      }
    }
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
