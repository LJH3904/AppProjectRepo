//
//  MemberPickButtonView.swift
//  RandomMember
//
//  Created by LJh on 2023/07/06.
//

import SwiftUI

struct MemberPickButtonView: View {
  @ObservedObject var memberStore : MemberStore
  
    var body: some View {
      NavigationLink {
        MemberPickView(memberStore: memberStore)
      } label: {
        HStack{
          Spacer()
          Label("Show member", systemImage: "person.fill.questionmark")
          Spacer()
        }
        .padding()
      }
      .disabled(memberStore.membersEmpty)
      .buttonStyle(.bordered)
      .tint(.accentColor)
      .padding()
    }
}

struct MemberPickButtonView_Previews: PreviewProvider {
    static var previews: some View {
      MemberPickButtonView(memberStore: MemberStore())
    }
}
