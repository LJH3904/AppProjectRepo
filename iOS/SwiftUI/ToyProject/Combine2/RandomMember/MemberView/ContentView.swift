//
//  ContentView.swift
//  RandomMember
//
//  Created by LJh on 2023/07/06.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationStack{
      VStack{
       Text("Practice Combine")
          .font(.largeTitle)
        Section{
          NavigationLink {
            TodoListView()
          } label: {
            Text("Todo")
              .foregroundColor(.black)
              .font(.title)
              .buttonStyle(.bordered)
              .tint(.accentColor)
              .background(.indigo)
              .padding()
          }

          NavigationLink {
            
            MemberListView()
          } label: {
            Text("RandomGame")
              .foregroundColor(.black)
              .font(.title)
              .background(.indigo)
              .padding()
          }
          
        }
      }
    }
  }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
