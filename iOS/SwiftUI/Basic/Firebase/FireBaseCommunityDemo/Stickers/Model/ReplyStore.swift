//
//  ReplyStore.swift
//  Stickers
//
//  Created by Jongwook Park on 2023/08/18.
//

import Foundation
import FirebaseFirestore

class ReplyStore: ObservableObject {
    @Published var replies: [Reply] = []
    
    var stickerId: String = ""
    
    let dbRef = Firestore.firestore().collection("Stickers")
    
    var sampleReply: Reply {
        Reply(text: "Good job!")
    }
    
    func fetchReplies() {
//        replies = [
//            sampleReply, sampleReply, sampleReply
//        ]
        
        dbRef.document(stickerId).collection("Replies").getDocuments { (snapshot, error) in
            self.replies.removeAll()
            
            if let snapshot {
                var tempReplies: [Reply] = []
                
                for document in snapshot.documents {
                    let id: String = document.documentID
                    
                    let docData: [String : Any] = document.data()
                    let username: String = docData["username"] as? String ?? ""
                    let text: String = docData["text"] as? String ?? ""
                    let createdAt: Double = docData["createdAt"] as? Double ?? 0
                    
                    let reply = Reply(id: id, username: username, text: text, createdAt: createdAt)
                    
                    tempReplies.append(reply)
                }
                
                self.replies = tempReplies
            }
        }
    }
    
    func addReply(_ reply: Reply) {
//        replies.append(reply)
        
        dbRef.document(stickerId).collection("Replies")
            .document(reply.id)
            .setData(["username": reply.username,
                      "text": reply.text,
                      "createdAt": reply.createdAt])
        
        fetchReplies()
    }
}
