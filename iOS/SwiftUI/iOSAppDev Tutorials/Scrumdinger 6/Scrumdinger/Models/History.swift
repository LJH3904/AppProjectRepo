//
//  History.swift
//  Scrumdinger
//
//  Created by JOHNNY_MAC_1 on 2023/08/02.
//

import Foundation

struct History: Identifiable ,Codable{
    let id: UUID
    let date: Date
    var attendees: [DailyScrum.Attendee]
    
    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee]){
        self.id = id
        self.date = date
        self.attendees = attendees
    }
}
