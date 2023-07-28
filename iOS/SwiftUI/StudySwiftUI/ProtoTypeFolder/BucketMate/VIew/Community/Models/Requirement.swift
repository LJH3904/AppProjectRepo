//
//  Requirement.swift
//  BucketMate
//
//  Created by gnksbm on 2023/07/27.
//

import Foundation

struct Requirement: Identifiable {
    var id: UUID = UUID()
    var locationString: String
    var minBudget: Double
    var maxBudget: Double
    var firstDate: Date
    var lastDate: Date
    var gender: Gender
    var tendency: Tendency
    var purpose: Purpose
    var bucketList: BucketList
    
    var period: String {
        let distance = Int(firstDate.distance(to: lastDate) / 86400)
        return "\(distance)박 \(distance + 1)일"
    }
}

enum Gender: String, CaseIterable {
    case man = "남자만", wonam = "여자만", both = "남녀혼성", dontCare = "상관없음", none = ""
    
    static let title: String = "성별"
}

enum Tendency: String, CaseIterable {
    case methodical = "계획적", extroverted = "외향적", impulsive = "즉흥적", rational = "이성적", none = ""
    
    static let title: String = "성향"
}

enum Purpose: String, CaseIterable {
    case activities = "액티비티", hocance = "호캉스", sightseeing = "경치 구경", foodExploration = "맛집 탐험", none = ""
    
    static let title: String = "여행목적"
}

enum BucketList: String, CaseIterable {
    case skyDiving = "스카이다이빙", underwaterExploration = "해저탐험", remoteExploration = "오지여행", oneMonthStay = "한달살기", none = ""
    
    static let title: String = "버킷리스트"
}
