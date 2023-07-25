//
//  ContentView.swift
//  ListNavDemo
//
//  Created by LJh on 2023/07/25.
//

import SwiftUI

struct ContentView: View {
  
  
  //@ObservedObject var carStore : CarStore = CarStore()
  @ObservedObject var carStore : CarStore = CarStore(cars: carData)
  //이게 다형성
  
  var body: some View {
    NavigationStack{
      List {
        
        ForEach(carStore.cars){ car in
          ListCell(car: car)
        }
//        .onDelete(perform: carStore.deleteItems)
        .onMove(perform: carStore.moveItems)
        
        .swipeActions(edge:.leading) {
          Button(role: .destructive) {
            //진짜 ㅋㅋ 몰카인가 ?
            //.destructive라는 연산프로퍼티가 삭제해주기에 onDeleter를 사용안해도됨
          } label: {
            Image(systemName: "bolt")
          }
        }
      }//:List
      .navigationTitle(Text("EV Cars"))
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          NavigationLink {
            AddNewCar(carStore: carStore)
          } label: {
            Text("ADD")
          }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          EditButton() //ToolbarItem에서만 사용합니다~
        }
      }//toolbar
    }//NavigationStack
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack{
      ContentView()
    }
  }
}


