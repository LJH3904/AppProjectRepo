//
//  testView.swift
//  Beenzino
//
//  Created by LJh on 2023/07/05.
//

import SwiftUI

struct testView: View {
  var todoStore : ToDoStore = ToDoStore()
  @State var mission: String = ""
  @State var isYes : Bool = true
  var complete : Complete {
    return isYes ? .yes : .no
  }
  
  var body: some View {
    VStack{
      TextField("mission", text: $mission)
      
      Toggle(isOn: $isYes) {
        Text("했나요?")
      }
      Button {
        
       todoStore.insertToDo(mission: mission, complete: complete)
       
        print("아티스트 추가버튼\(todoStore.todos.count)")
      } label: {
        Text("아티스트 추가")
      }
    }
  }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
