//
//  TodoAddView.swift
//  RandomMember
//
//  Created by LJh on 2023/07/06.
//

import SwiftUI

struct TodoAddView: View {
  var todoStore : TodoStore
  
  @State var mission : String = ""
    var body: some View {
      NavigationStack{
        VStack{
          Text("Please enter the this Textfield")
            .font(.largeTitle)
          TextField("Write in this Textfield", text: $mission)
            .textFieldStyle(.roundedBorder)
            .font(.largeTitle)
            .padding()
            
          HStack{
            Button {
              mission = ""
            } label: {
              Text("\(Image(systemName: "delete.left"))")
                .foregroundColor(.black)
                .font(.largeTitle)
            }
            Button {
              todoStore.addTodo(mission: mission)
            } label: {
              
              Text("\(Image(systemName: "plus.rectangle.on.folder"))")
                .foregroundColor(.black)
                .font(.largeTitle)
            }
          }
        }
      }.navigationTitle("Insert")
    }
}

struct TodoAddView_Previews: PreviewProvider {
    static var previews: some View {
      TodoAddView(todoStore : TodoStore())
    }
}
