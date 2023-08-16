//
//  Memo.swift
//  MyMemo
//
//  Created by 안지영 on 2023/08/16.
//

import Foundation

struct Memo: Identifiable, Codable {
    var id: String = UUID().uuidString
    var title: String
    var text: String
}
