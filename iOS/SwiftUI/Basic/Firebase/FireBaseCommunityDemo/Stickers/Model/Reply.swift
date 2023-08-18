//
//  Reply.swift
//  Stickers
//
//  Created by Jongwook Park on 2023/08/18.
//

import Foundation

struct Reply: Identifiable {
    var id: String = UUID().uuidString
    var username: String = "Kevin"
    var text: String
    var createdAt: Double = Date().timeIntervalSince1970
    
    var createdDate: String {
        let dateCreatedAt: Date = Date(timeIntervalSince1970: createdAt)
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
        
        return dateFormatter.string(from: dateCreatedAt)
    }
}
