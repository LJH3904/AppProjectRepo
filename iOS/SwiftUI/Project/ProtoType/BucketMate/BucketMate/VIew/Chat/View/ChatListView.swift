//
//  ChatListView.swift
//  BucketMate
//
//  Created by 유하은 on 2023/07/27.
//

import SwiftUI

struct ChatListView: View {
  @ObservedObject var memberStore : MemberStore = MemberStore()
    
  var body: some View {
    NavigationStack{
      List{
        ForEach(memberStore.memberStore) { index in
          NavigationLink {
              ChatView(name: index.name)
          } label: {
              HStack {
                  Image(index.image)
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 45, height: 45)
                      .clipShape(Circle())
                  VStack {
                      HStack {
                          Text("\(index.name)")
                              .font(
                                Font.custom("Roboto", size: 18)
                                    .weight(.regular)
                              )
                          Spacer()
                      }
                      HStack {
                          Text("계획이 맘에 들어서 그런데 동참해도 될까요?")
                              .font(
                                Font.custom("Roboto", size: 16)
                                    .weight(.light)
                              )
                              .foregroundColor(.gray)
                          Spacer()
                      }
                  }.padding(15)
                  Spacer()
              }
          }.listRowSeparator(.hidden)
        }.swipeActions(edge:.trailing) {
          Button(role: .destructive) {} label: {
            Image(systemName: "trash")
          }
        }
      }.listStyle(.plain)
      .navigationTitle(Text("채팅 리스트"))
      .toolbar {
//        ToolbarItem(placement: .navigationBarTrailing) {
//          Image(systemName: "magnifyingglass")
//        }
      }
    }
  }
}

struct ChatListView_Previews: PreviewProvider {
  static var previews: some View {
    ChatListView()
  }
}
