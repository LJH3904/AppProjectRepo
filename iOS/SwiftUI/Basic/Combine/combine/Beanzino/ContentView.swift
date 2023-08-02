//
//  ContentView.swift
//  Beenzino
//
//  Created by Jongwook Park on 2023/07/05.
//

import SwiftUI

struct ContentView: View {
  //MARK: - 투두앱
  
  @ObservedObject var todoStore : ToDoStore = ToDoStore() // 옵저버에 메인
  @State var showtest: Int = 0
  @State var mission: String = ""
  @State var isYes : Bool = true
  var complete : Complete {
    return isYes ? .yes : .no
  }
  
  var body: some View {
    VStack{
      List{
        ForEach(todoStore.todos){ todo in
          
          VStack(alignment: .leading){
            
            Text("날짜: \(todo.date.formatted(date:.omitted, time: .shortened))")
            Text("\(todo.mission)")
            Text("\(todo.complete == .yes ? "🥳" : "😕")")
            
          }
          
          Button {
            
            todoStore.removeToDo(todo)
            print("삭제버튼 눌렀고 남은 요소 수 : \(todoStore.todos.count)")
          } label: {
            Text("삭제")
          }
        }
      }
      
            Section{
              TextField("mission", text: $mission)
      
              Toggle(isOn: $isYes) {
                Text("했나요?")
              }
              Button {
      
                todoStore.insertToDo(mission: mission, complete: complete)
      
              } label: {
                Text("아티스트 추가")
              }
            }.padding()

    }

  }
  
}
  
  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
  }


//MARK: - testㅍ뷰

//MARK: - 챗지피티

//
//class ViewModel: ObservableObject {
//    @Published var data: String = ""
//}
//
//struct View1: View {
//    @ObservedObject var viewModel: ViewModel
//
//    var body: some View {
//        TextField("Enter data", text: $viewModel.data)
//    }
//}
//
//struct View2: View {
//    @ObservedObject var viewModel: ViewModel
//
//    var body: some View {
//        Text(viewModel.data)
//    }
//}
//
//struct ContentView: View {
//    @StateObject var viewModel = ViewModel()
//
//    var body: some View {
//        VStack {
//            View1(viewModel: viewModel)
//            View2(viewModel: viewModel)
//        }
//    }
//}
