//
//  StickerDetailView.swift
//  Stickers
//
//  Created by Jongwook Park on 2023/08/18.
//

import SwiftUI

struct StickerDetailView: View {
    var sticker: Sticker
    
    @StateObject var replyStore = ReplyStore()
    
    @State private var replyText: String = ""
    
    
    var trimReplyText: String {
        replyText.trimmingCharacters(in: .whitespaces)
    }
    
    var body: some View {
        VStack {
            StickerCellView(sticker: sticker)
            
            List(replyStore.replies) { reply in
                VStack(alignment: .leading) {
                    Text(reply.text)
                    HStack {
                        Text(reply.username)
                        Spacer()
                        Text(reply.createdDate)
                    }
                    .font(.footnote)
                }
            }
            .listStyle(.plain)
            .refreshable {
                replyStore.fetchReplies()
            }
            
            HStack {
                TextField("Add reply", text: $replyText)
                
                    Button("Add") {
                        let reply = Reply(text: trimReplyText)
                        replyStore.addReply(reply)
                        replyText = ""
                    }
                    .disabled(trimReplyText.isEmpty)
            }
            .padding()
        }
        .navigationTitle("Sticker details")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            replyStore.stickerId = sticker.id
            replyStore.fetchReplies()
        }
    }
}

struct StickerDetailView_Previews: PreviewProvider {
    @State static var sticker = StickerStore().sampleSticker
    
    static var previews: some View {
        NavigationStack {
            StickerDetailView(sticker: sticker)
        }
    }
}
