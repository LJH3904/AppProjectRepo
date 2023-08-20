//
//  AddView.swift
//  Checking
//
//  Created by LJh on 2023/08/19.
//

import SwiftUI

struct AddView: View {
  @ObservedObject var peopleStore : PeopleStore
  @Binding var isShowingAddView : Bool
  @State var inpurText : String = ""
  var body: some View {
    VStack {
      Text("추가페이지")
      
        .font(.title)
      Divider()
      TextField("추가할 사람의 이름을 입력하세요.", text: $inpurText).textFieldStyle(.roundedBorder)
      Divider()
      HStack {
        Spacer()
        Button {
          peopleStore.addPeople(People(name: inpurText, sex: "남", birth: "20000112", tel: "추가된 번호", organization: "몰라", Departure: "오후 5시 탑승"))
          isShowingAddView = false
        } label: {
          Text("추가")
        }
        Spacer()
        Button {
          isShowingAddView = false
        } label: {
          Text("취소")
            .foregroundColor(.red)
        }
        Spacer()
      }
    }
  }
}
