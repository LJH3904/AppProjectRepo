//
//  TodoListView.swift
//  RandomMember
//
//  Created by LJh on 2023/07/06.
//

import SwiftUI

struct TodoListView: View {
  @ObservedObject var todoStore : TodoStore = TodoStore()
  @State var isShowingAlert : Bool = false
  var body: some View {
    NavigationStack{
      
      VStack{
       
        List(todoStore.todos) { todo in
          HStack{
            Text("\(todo.mission)")
            Spacer()
            Button {
              todoStore.deleteTodo(todo)
            } label: {
              Text("\(Image(systemName: "minus.circle.fill"))")
                .foregroundColor(.black)
            }
          }
        }
      }
    }.navigationTitle("You have a \(todoStore.todoCount) ToDo")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            isShowingAlert = true
          } label: {
            Label("AllDelete", systemImage: "trash.fill")
              .foregroundColor(.black)
          }
          
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          NavigationLink {
            TodoAddView(todoStore: todoStore)
          } label: {
            Text("\(Image(systemName: "plus.circle.fill"))")
              .foregroundColor(.black)
          }
          
        }
      }.alert(isPresented: $isShowingAlert) {
        Alert(title: Text("Are you delete all this todo? ") , message: Text("real?") , primaryButton: .destructive(Text("Delete")){
          todoStore.removeTodoAll()
        },secondaryButton: .cancel(Text("Cancle")))}
    
  }
}

struct TodoListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack{
      TodoListView()
    }
  }
}
