//
//  SearchView.swift
//  Checking
//
//  Created by LJh on 2023/08/18.
//

import SwiftUI

struct SearchView: View {
  @ObservedObject var peopleStore : PeopleStore
  @Binding var searchName : String
  @Binding var isShowingshee : Bool
  
 
  var body: some View {
    VStack{
      Spacer()
      ForEach(peopleStore.peoples, id: \.self){ people in
        if people.name == searchName {
          
          VStack(alignment: .leading, spacing: 10 ){
            
            Text("이름 : \(people.name)")
              .font(.title)
            Text("출발 : \(people.Departure)")
            Text("소속 : \(people.organization)")
            
          }
          .font(.body)
          .fontWeight(.heavy)
        }
      }
      
      Spacer()
      Divider()

      List(peopleStore.delPeople , id: \.self){ delppl in
        Text("\(delppl.name)")
      }
      
      Spacer()
      HStack {
        Spacer()
        Button {
          for people in peopleStore.peoples {
            if people.name == searchName {
              peopleStore.deleteMonster(people)
              peopleStore.addDelPeople(people)
              searchName = ""
              isShowingshee = false
            }
          }
        } label: {
          Text("삭제")
            .font(.title)
            
      }
        Spacer()
        Button {
          isShowingshee = false
        } label: {
          Text("취소")
            .foregroundColor(.red)
        }
        Spacer()
      }
    }
    .padding()
    .refreshable {
      peopleStore.fetchdelPeople()
      
    }
    .onAppear(){
      peopleStore.fetchdelPeople()
      
    }
  }
}


