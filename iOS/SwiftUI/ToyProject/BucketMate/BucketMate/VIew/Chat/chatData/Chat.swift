//
//  Chat.swift
//  BucketMate
//
//  Created by LJh on 2023/07/27.
//

import Foundation

struct Message {
    var content: String
    var user: User
}

struct User {
    var name: String
    var avatar: String
    var isCurrentUser: Bool = false
}
