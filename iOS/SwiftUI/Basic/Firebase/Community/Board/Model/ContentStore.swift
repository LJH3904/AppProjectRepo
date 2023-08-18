//
//  ContentStore.swift
//  Board
//
//  Created by 변상필 on 2023/08/18.
//

import Foundation
import FirebaseFirestore

class ContentStore: ObservableObject {
    @Published var notiContents: [Content] = []
    @Published var communityContents: [Content] = []
    
    var boardId: String = ""
    
    var dbRef = Firestore.firestore().collection("공지사항")
    

    
    
    func fetchContents(DBname: String) {
        if DBname == "공지사항" {
            dbRef = Firestore.firestore().collection("공지사항")
            
        } else {
            dbRef = Firestore.firestore().collection("자유게시판")
            
        }
        dbRef.getDocuments { (snapshot, error) in
            self.notiContents.removeAll()
            
            if let snapshot {
                var tempContents: [Content] = []
                
                for document in snapshot.documents {
                    let id: String = document.documentID
                    
                    let docData: [String: Any] = document.data()
                    let username: String = docData["username"] as? String ?? ""
                    let title: String = docData["title"] as? String ?? ""
                    let article: String = docData["article"] as? String ?? ""
                    let createdAt: Double = docData["createdAt"] as? Double ?? 0
                    
                    let content = Content(id: id, username: username, title: title, article: article, createdAt: createdAt)
                    
                    tempContents.append(content)
                }
                
                if DBname == "공지사항" {
                    self.notiContents = tempContents
                } else {
                    self.communityContents = tempContents
                }
            }
            
        }

    }
    
    func addContent(_ content: Content, DBname: String) {
//        communityContents.append(content)
//        print(sw)
        if DBname == "공지사항" {
            dbRef = Firestore.firestore().collection("공지사항")
            
        } else {
            dbRef = Firestore.firestore().collection("자유게시판")
            
        }
        

        print(dbRef.document(content.id)
            .setData(["username": content.username,
                      "title": content.title,
                      "article": content.article,
                      "createdAt": content.createdAt
                     ]))
        print("communityContents : \(communityContents)")
        fetchContents(DBname: DBname)
        
    }
    func removeContent(_ content: Content, DBname: String) {
        if DBname == "공지사항" {
            dbRef = Firestore.firestore().collection("공지사항")
            
        } else {
            dbRef = Firestore.firestore().collection("자유게시판")
            
        }
        dbRef.document(content.id).delete()
        fetchContents(DBname: DBname)

    }
}
