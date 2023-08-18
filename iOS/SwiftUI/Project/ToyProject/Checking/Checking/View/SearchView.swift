//
//  SearchView.swift
//  Checking
//
//  Created by LJh on 2023/08/18.
//

import SwiftUI

struct SearchView: View {
  @ObservedObject var peopleStore : PeopleStore
  @State var searchName : String
  @State var showText : String = ""
  
  var body: some View {
    VStack{
      Spacer()
      Text("\(showText)님이 삭제되었습니다.")
      Spacer()
      ForEach(peopleStore.peoples, id: \.self){ people in
        if people.name == searchName {
          VStack(alignment: .leading, spacing: 10 ){
            Text("이름 : \(people.name)")
            Text("출발 : \(people.Departure)")
            Text("성별 : \(people.sex)")
            Text("전화번호 : \(people.tel)")
            Text("생년월일 : \(people.birth)")
            
          }
          .font(.body)
          .fontWeight(.heavy)
        }
      }
      Spacer()
      Button {
        for people in peopleStore.peoples {
          if people.name == searchName {
            peopleStore.deleteMonster(people)
            showText = people.name
            peopleStore.addDelPeople(people)
          }
        }
      } label: {
        Text("삭제")
          .font(.headline)
      }
      Divider()
      
      
      VStack {
        Form {
          List(peopleStore.delPeople , id: \.self){ delppl in
            Text("\(delppl.name)")
          }
        }
      }
      Spacer()
    }
    .refreshable {
      peopleStore.fetchdelPeople()
      
    }
    .onAppear(){
      peopleStore.fetchdelPeople()
      
    }
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView(peopleStore: PeopleStore(),searchName: "asd" )
  }
}
