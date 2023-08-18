//
//  ReplyStore.swift
//  Board
//
//  Created by 변상필 on 2023/08/18.
//

import Foundation
import FirebaseFirestore

class ReplyStore: ObservableObject {
    @Published var replies: [Reply] = []
    
    var conatentId: String = ""
    
    private var dbRef = Firestore.firestore().collection("자유게시판")
    
    func fetchReplies() {
        
        dbRef.document(conatentId).collection("Replies").getDocuments { (snapshot, error) in
            self.replies.removeAll()
            
            if let snapshot {
                var tempReplies: [Reply] = []
                
                for document in snapshot.documents {
                    let id: String = document.documentID
                    
                    let docData: [String: Any] = document.data()
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
        dbRef.document(conatentId).collection("Replies")
            .document(reply.id)
            .setData([
                "username": reply.username,
                "text": reply.text,
                "createdAt": reply.createdAt
            ])
        
        fetchReplies()
    }
}
