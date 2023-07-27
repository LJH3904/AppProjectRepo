//
//  MessageBubble.swift
//  BucketMate
//
//  Created by LJh on 2023/07/27.
//

import SwiftUI

struct MessageBubble: View {
  var message : Message 
  @State private var showTime = false
  
    var body: some View {
      VStack(alignment: message.received ? .leading : .trailing){
        HStack{
          Text(message.text)
            .padding()
            .background( message.received ? Color.gray : Color.blue)
            .foregroundColor(.white)
            .font(.system(size: 30))
            .cornerRadius(50)
        }
        .frame( maxWidth: .infinity,alignment: message.received ? .leading : .trailing)
        .onTapGesture {
          showTime.toggle()
        }
        if showTime {
          
          Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
            .font(.caption2)
            .foregroundColor(.gray)
            .padding(message.received ? .leading :.trailing)
        }
      }
      .frame(maxWidth: .infinity, alignment:.trailing)
      .padding( message.received ? .leading : .trailing , 10)
      .padding(.horizontal, 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
      MessageBubble(message: Message( text: "ㄴㄴ", received: true, timestamp: Date()))
    }
}
