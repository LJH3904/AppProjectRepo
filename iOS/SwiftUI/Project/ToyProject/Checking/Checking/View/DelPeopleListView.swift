//
//  DelPeopleListView.swift
//  Checking
//
//  Created by LJh on 2023/08/19.
//

import SwiftUI

struct DelPeopleListView: View {
  @ObservedObject var DelPeople : PeopleStore
  @Binding var isShowingDelPeopleListView : Bool
    var body: some View {
      Text("삭제된 사람들")
        .font(.title)
      List{
        ForEach(DelPeople.delPeople,id: \.self){ people in
          Text("\(people.name)")
        }
      }
      
      Button {
        isShowingDelPeopleListView = false
      } label: {
        Text("취소")
          .foregroundColor(.red)
      }
      
    }
}
