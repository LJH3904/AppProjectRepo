//
//  ContentView.swift
//  Checking
//
//  Created by LJh on 2023/08/18.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var peopleStore : PeopleStore = PeopleStore()
  @State var searchName = ""
  
  @State var isShowingShee = false
  var body: some View {
    VStack{
      Spacer()
      HStack {
        TextField("찾을이름검색", text: $searchName)
          .textFieldStyle(.roundedBorder)
        Spacer()
        Button {
          isShowingShee = true
        } label: {
          Text("검색")
        }
        Spacer()
        Button {
          peopleStore.resetAll()
        } label: {
          Text("Reset")
        }
        Spacer()
      }

      List{
        ForEach(peopleStore.peoples , id: \.self ){ people in
          if people.Departure == "오후 5시 탑승"{
            VStackq(alignment: .leading, spacing: 10 ){
              Text("이름 : \(people.name)")
              Text("출발 : \(people.Departure)")
              Text("성별 : \(people.sex)")
              Text("전화번호 : \(people.tel)")
              Text("생년월일 : \(people.birth)")
            }
            
          }
        }
      }
    }
    .sheet(isPresented: $isShowingShee, content: {
      SearchView(peopleStore: peopleStore, searchName: searchName)
    })
    .onAppear(){
      peopleStore.fetchUser()
      peopleStore.fetchProduct()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
