//
//  RequirementStore.swift
//  BucketMate
//
//  Created by gnksbm on 2023/07/27.
//


import Foundation
let bundleDescription: String = ""
let bundleRequirement = Requirement(locationString: "지역을 선택하세요", minBudget: 100000, maxBudget: 9000000, firstDate: Date(), lastDate: Date(timeInterval: 86400, since: .now), gender: .none, tendency: .none, purpose: .none, bucketList: .none)

class PostStore: ObservableObject {
    @Published var postList: [RecruitPost]
    @Published var recruitPost: RecruitPost = RecruitPost(user: User(name: "rapunzel", imageUrlString: "Rapunzel"), postImageString: "spain", country: "🇪🇸 Spain", title: "⚽️ 캄프누 경기 보러 가실분!", description: bundleDescription, requirement: bundleRequirement)
    
    let buttonNames: [String] = ["전체보기", "국가", "예상경비", "기간", "최신순"]
    let imageNames: [String] = ["스페인", "아일랜드", "이태리", "터키", "핀란드", "한국"]
    
    
    
    
    
    init() {
        self.postList = [
            RecruitPost(user: User(name: "rapunzel", imageUrlString: "rapunzel"), postImageString: "pic1", country: "Spain 🇪🇸", title: "⚽️ 캄프누 경기 보러 가실분!", description: bundleDescription, requirement: Requirement(locationString: "지역을 선택하세요", minBudget: 10000000, maxBudget: 20000000, firstDate: Date(), lastDate: Date(timeInterval: 86400 * 5, since: .now), gender: .none, tendency: .none, purpose: .none, bucketList: .none)),
            RecruitPost(user: User(name: "rapunzel", imageUrlString: "rapunzel"), postImageString: "pic2", country: "Türkiye 🇹🇷", title: "카파도키아 열기구 타실분!!", description: bundleDescription, requirement: Requirement(locationString: "지역을 선택하세요", minBudget: 200000, maxBudget: 500000, firstDate: Date(), lastDate: Date(timeInterval: 86400 * 20, since: .now), gender: .none, tendency: .none, purpose: .none, bucketList: .none)),
            RecruitPost(user: User(name: "rapunzel", imageUrlString: "rapunzel"), postImageString: "pic3", country: "🇪🇸 Spain", title: "낭만의 도시 베네치아 곤돌..", description: bundleDescription, requirement: Requirement(locationString: "지역을 선택하세요", minBudget: 300000, maxBudget: 900000, firstDate: Date(), lastDate: Date(timeInterval: 86400 * 7, since: .now), gender: .none, tendency: .none, purpose: .none, bucketList: .none)),
        ]
//        Recruit(country: "🇪🇸 Spain", title: "⚽️ 캄프누 경기 보러 가실분!", countryImage: "https://image.newsis.com/2020/04/21/NISI20200421_0016275359_web.jpg", writerImage: "rapunzel", writer: "Rapunzel", predictDate: "8월 중", predictExpense: "120 ~ 300 만원", recruitNumber: "1 ~ 4인", period: "3박 4일"),
//        Recruit(country: "🇹🇷 Türkiye", title: "카파도키아 열기구 타실분!!", countryImage: "https://d3b39vpyptsv01.cloudfront.net/photo/1/2/92cb6276cc547053db7fda361d46d1bf.jpg", writerImage: "rapunzel", writer: "Rapunzel", predictDate: "8월 중", predictExpense: "120 ~ 300 만원", recruitNumber: "1 ~ 4인", period: "3박 4일"),
//        Recruit(country: "🇮🇹 Italy", title: "낭만의 도시 베네치아 곤돌..", countryImage: "https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1200,h_630/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/wkahj1pqqptwdabd7lhq/%EB%B2%A0%EB%84%A4%EC%B9%98%EC%95%84%20%EA%B3%A4%EB%8F%8C%EB%9D%BC%20%EC%B2%B4%ED%97%98.jpg", writerImage: "rapunzel", writer: "Rapunzel", predictDate: "8월 중", predictExpense: "120 ~ 300 만원", recruitNumber: "1 ~ 4인", period: "3박 4일"),
    }
    
    func addNewPost(_ newPost: RecruitPost) {
        postList.insert(newPost, at: 0)
//        postList.append(newPost)
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
