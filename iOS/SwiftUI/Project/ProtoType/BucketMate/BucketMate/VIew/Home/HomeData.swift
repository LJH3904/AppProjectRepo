//
//  HomeData.swift
//  BucketMate
//
//  Created by 마경미 on 27.07.23.
//

import Foundation

struct Place: Identifiable {
    let id = UUID()
    let imageUrl: String
    let placeTitle: String
    var isSelected: Bool
}

let places: [Place] = [
    Place(imageUrl: "https://search.pstatic.net/common/?src=https%3A%2F%2Fshopping-phinf.pstatic.net%2Fmain_3684403%2F36844031056.jpg&type=f372_372", placeTitle: "발리", isSelected: true),
    Place(imageUrl: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAzMjlfMjEz%2FMDAxNjgwMDYxMDkwNDA4.xT3MR_maK_8xUck6gHUTFxzjnn911cxb0660sDZCVREg.5nqszfGZgboMna_1FBzQLfFVkshMhuwBYuZgUj-l6Hgg.JPEG.hyunicely%2FIMG_6208.JPG&type=sc960_832", placeTitle: "코타키나발루", isSelected: false),
    Place(imageUrl: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA2MjZfMjMx%2FMDAxNjg3NzEwMDc4MzU0.mKsFSv3rZE5xfV_qZMJYzXd_k0VEH5fF0F-xJIypgWMg.13lCcuhkjjOOx_o1yzwY_N9NXOoRZ1ttUtWXDyz0tMUg.JPEG.msjh1012%2F%25C4%25A1%25BE%25D3%25B8%25B6%25C0%25CC_%25B3%25AF%25BE%25BE8.jpg&type=sc960_832", placeTitle: "치앙마이", isSelected: false),
    Place(imageUrl: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA5MTdfMjQ1%2FMDAxNjYzMzc2NjI5MzQ4.QAAGlRj34ptnaaqF6YfIfIx88_-T_gdxrZFnVEFPEeYg.EmEvs3B6jgap8gcv-8Hzgx3dA2NFH2irY1i0AW9C3OYg.JPEG.our3986%2FIMG_3249.jpg&type=sc960_832", placeTitle: "파리", isSelected: false),
    Place(imageUrl: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20120905_201%2F0109lsh_1346808328260N8Wup_JPEG%2F%25C8%25A6%25B7%25A3%25B5%25E5.jpg&type=sc960_832", placeTitle: "네덜란드", isSelected: false)
]

struct Post: Identifiable, Hashable {
    let id = UUID()
    let imageUrl: String
    let title: String
    let writerImage: String
    let writer: String
    let description: String
}

let posts: [Post] = [
    Post(imageUrl: "https://cdn.tourtoctoc.com/news/photo/202306/839_5064_66.jpg", title: "최고의 휴양지, 발리 다녀왔어요.", writerImage: "rapunzel", writer: "Rapunzel", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
    Post(imageUrl: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAyMjhfMzkg%2FMDAxNjc3NTcwNjM4ODI2.oigZx2mjdX0U7v1XQYs5WiSHVSdzpvG7G7tZAtnl2esg.D0icagY0gwVpmMI_UJapBnskEZOpcGjJaKrtQ8eL6Xsg.PNG.hotel-tour%2F%25B9%25E8%25B0%25E614.png&type=sc960_832", title: "신혼여행 추천, 발리", writerImage: "rapunzel", writer: "Rapunzel", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
]

struct Recruit: Identifiable {
    let id = UUID()
    let country: String
    let title: String
    let countryImage: String
    let writerImage: String
    let writer: String
    let predictDate: String
    let predictExpense: String
    let recruitNumber: String
    let period: String
}

let recruits: [Recruit] = [
    Recruit(country: "🇪🇸 Spain", title: "⚽️ 캄프누 경기 보러 가실분!", countryImage: "https://image.newsis.com/2020/04/21/NISI20200421_0016275359_web.jpg", writerImage: "rapunzel", writer: "Rapunzel", predictDate: "8월 중", predictExpense: "120 ~ 300 만원", recruitNumber: "1 ~ 4인", period: "3박 4일"),
    Recruit(country: "🇹🇷 Türkiye", title: "카파도키아 열기구 타실분!!", countryImage: "https://d3b39vpyptsv01.cloudfront.net/photo/1/2/92cb6276cc547053db7fda361d46d1bf.jpg", writerImage: "rapunzel", writer: "Rapunzel", predictDate: "8월 중", predictExpense: "120 ~ 300 만원", recruitNumber: "1 ~ 4인", period: "3박 4일"),
    Recruit(country: "🇮🇹 Italy", title: "낭만의 도시 베네치아 곤돌..", countryImage: "https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1200,h_630/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/wkahj1pqqptwdabd7lhq/%EB%B2%A0%EB%84%A4%EC%B9%98%EC%95%84%20%EA%B3%A4%EB%8F%8C%EB%9D%BC%20%EC%B2%B4%ED%97%98.jpg", writerImage: "rapunzel", writer: "Rapunzel", predictDate: "8월 중", predictExpense: "120 ~ 300 만원", recruitNumber: "1 ~ 4인", period: "3박 4일"),
]
