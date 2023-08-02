//
//  TodoStore.swift
//  RandomMember
//
//  Created by LJh on 2023/07/06.
//

import Foundation

class TodoStore : ObservableObject {
  @Published var todos : [Todo] = []
  
  var todoCount : Int{
    get {
      return todos.count
    }
  }
  
//  init(){
//    todos = [Todo(mission: "일어나이새기야")]
//  }
  func addTodo(mission : String){
    let todo : Todo = Todo(mission: mission)
    todos.append(todo)
  }
  
  func deleteTodo(_ todo : Todo ){
    todos.removeAll(where: { $0.id == todo.id} )
  }
  
  func removeTodoAll(){
    todos.removeAll()
  }
  
}
