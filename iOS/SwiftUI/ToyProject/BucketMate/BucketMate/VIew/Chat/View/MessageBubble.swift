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
        //<<<<<<< Updated upstream
        //      VStack(alignment: message.received ? .leading : .trailing){
        //        HStack{
        //          Text(message.text)
        //            .padding()
        //            .background( message.received ? Color.gray : Color.blue)
        //            .foregroundColor(.white)
        //            .font(.system(size: 30))
        //<<<<<<< HEAD
        //            .cornerRadius(50)
        //=======
        VStack(alignment: message.received ? .leading : .trailing){
            HStack{
                Text(message.text)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                
                    .background( message.received ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                    .cornerRadius(14)
                
            }
            .frame( maxWidth: .infinity,alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            .padding(10)
            if showTime {
                
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading :.trailing)
            }
            //>>>>>>> Stashed changes
            //=======
            //            .cornerRadius(20)
            //>>>>>>> main
            //        }
            //        .frame(maxWidth: .infinity, alignment:.trailing)
            //        .padding( message.received ? .leading : .trailing , 10)
            //        .padding(.horizontal, 10)
        }
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message( text: "ㄴㄴ", received: true, timestamp: Date()))
    }
}
