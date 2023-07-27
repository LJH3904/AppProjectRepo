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
            ChatView()
          } label: {
            Image(index.image)
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 80 ,height: 80)
              .clipShape(Circle())
            Text("\(index.name)")
              .font(.largeTitle)
              .foregroundColor(.black)
          }
        }.swipeActions(edge:.trailing) {
          Button(role: .destructive) {} label: {
            Image(systemName: "trash")
          }
        }
      }.listStyle(.inset)
      .navigationTitle(Text("채팅 리스트"))
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Image(systemName: "magnifyingglass")
        }
      }
      
    }
  }
}

struct ChatListView_Previews: PreviewProvider {
  static var previews: some View {
    ChatListView()
  }
}
