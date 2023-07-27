//
//  ChatView.swift
//  BucketMate
//
//  Created by LJh on 2023/07/27.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var messageStore : MessageStore = MessageStore()
    @State var message = ""
    var body: some View {
      VStack{
        ScrollView{
          ForEach(messageStore.messageStore){ text in
            MessageBubble(message: Message(text: text.text, received: text.received, timestamp: Date()))
          }
        }
        HStack {
          TextField("메시지를 입력해", text: $message)
          Button {
            messageStore.insertMessage(message)
            message = ""
          } label: {
            Text("전송")
          }
        }
      }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
      ChatView()
    }
}
