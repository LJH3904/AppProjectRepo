//
//  RequirementStore.swift
//  BucketMate
//
//  Created by gnksbm on 2023/07/27.
//

import Foundation

class RequirementStore: ObservableObject {
    @Published var requirements: [Requirement]
    
    let buttonNames: [String] = ["전체보기", "국가", "예상경비", "기간", "최신순"]
    let imageNames: [String] = ["스페인", "아일랜드", "이태리", "터키", "핀란드", "한국"]
    init(requirements: [Requirement]) {
        self.requirements = requirements
    }
}

enum Country: CaseIterable {
    case spain, ireland, italy, turkey, finland, korea
    
    var toString: String {
        switch self {
        case .spain:
            return "스페인"
        case .ireland:
            return "아일랜드"
        case .italy:
            return "이태리"
        case .turkey:
            return "터키"
        case .finland:
            return "핀란드"
        case .korea:
            return "한국"
        }
    }
}
enum MainCategory: CaseIterable {
    case all, country, budget, period, recently
    
    var toString: String {
        switch self {
        case .all:
            return "전체보기"
        case .country:
            return "국가"
        case .budget:
            return "예상경비"
        case .period:
            return "기간"
        case .recently:
            return "최신순"
        }
    }
    
    func selectCategory<T>(list: [Requirement], secondSelected: T) -> [Requirement] {
        switch self {
        case .all:
            return list
        case .country:
            return []
        case .budget:
            return []
        case .period:
            return []
        case .recently:
            return list.sorted { $0.firstDate.timeIntervalSince1970 > $1.firstDate.timeIntervalSince1970}
        }
    }
}

