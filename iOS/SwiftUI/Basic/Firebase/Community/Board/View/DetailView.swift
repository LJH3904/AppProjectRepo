//
//  DetailView.swift
//  Board
//
//  Created by 변상필 on 2023/08/18.
//

import SwiftUI

struct DetailView: View {
    var content: Content
    
    @ObservedObject var replyStore = ReplyStore()
    
    @State var username: String = ""
    @State var text: String = ""
    
    var body: some View {
        VStack{
            Text(content.title)
            Text(content.username)
            Text(content.createdDate)
            
            Text(content.article)
            Divider()
            List(replyStore.replies) { reply in
                VStack {
                    Text(reply.username)
                    Text(reply.text)
                    Text(reply.createdDate)
                }
                
            }
            .listStyle(.plain)
            HStack{
                VStack {
                    TextField("이름 입력", text: $username, axis: .vertical)
                    TextField("내용 입력", text: $text, axis: .vertical)
                }
                Button {
                    let tempReply = Reply(username: username, text: text)
                    replyStore.addReply(tempReply)
                    username = ""
                    text = ""
                } label: {
                    Text("댓글 추가")
                }
                .disabled(text.isEmpty)
            }

        }
        .onAppear {
            replyStore.conatentId = content.id
            replyStore.fetchReplies()
        }
        }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(content: Content(username: "123", title: "`123", article: "123"))
    }
}
