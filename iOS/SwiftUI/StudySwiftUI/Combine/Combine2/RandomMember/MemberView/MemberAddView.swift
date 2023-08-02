//
//  MemberAddView.swift
//  RandomMember
//
//  Created by LJh on 2023/07/06.
//

import SwiftUI

struct MemberAddView: View {
  var memberStore : MemberStore
  
  @Binding var isShowingSheet : Bool
  
  @State var name : String = ""
  var body: some View {
    NavigationStack{
      VStack{
          TextField("이름", text: $name)
          .textFieldStyle(.roundedBorder)
          .font(.largeTitle)
          .padding()
          Spacer()
        
      }
      .navigationTitle("New Member")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            if name.isEmpty == true {
              return
            }
            memberStore.addMember(name: name)
            isShowingSheet = false
          } label: {
            Text("추가")
          }
        }
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            isShowingSheet = false
          } label: {
            Text("취소")
          }
        }
      }
    }
  }
}

struct MemberAddView_Previews: PreviewProvider {
  static var previews: some View {
    MemberAddView(memberStore : MemberStore(),isShowingSheet : .constant(true))
  }
}
