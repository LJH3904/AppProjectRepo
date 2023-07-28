//
//  Advertising.swift
//  BucketMate
//
//  Created by 봉주헌 on 2023/07/28.
//

import SwiftUI



//struct Advertising: View {
//    @State private var currentPage: Int = 0
//    private let totalPages: Int = 3 // 전체 페이지 수
//
//    let adImagesName: [String] = ["CatPost", "insuranceAd", "JejuAirPost"]
//
//
//    var body: some View {
//        NavigationStack {
//            GeometryReader { geometry in
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(spacing: 0) {
//                        ForEach(0..<totalPages, id: \.self) { pageIndex in
//                            // 여기에서 각 페이지에 대한 콘텐츠를 추가합니다.
//                            // 예를 들면 이미지 또는 텍스트를 사용할 수 있습니다.
//                            // 여기서는 간단한 텍스트를 사용합니다.
//                            NavigationLink(destination: CatPostDetail()) {
//                                Image("CatPost")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .cornerRadius(20)
//                            }
//                            .frame(width: geometry.size.width, height: geometry.size.height)
//                        }
//                    }
//                }
//                .content.offset(x: CGFloat(currentPage) * -geometry.size.width)
//                .animation(.easeInOut(duration: 1)) // 애니메이션 속도 조정
//
//                // 3초마다 페이지 전환을 위한 Timer 설정
//                .onAppear {
//                    let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
//                        withAnimation {
//                            currentPage = (currentPage + 1) % totalPages
//                        }
//                    }
//                    // 타이머는 뷰가 사라질 때 무시되도록 해제해야 합니다.
//                    RunLoop.current.add(timer, forMode: .common)
//                }
//            }
//        }
//    }
//}

struct Advertising: View {
    var body: some View {

//        기존 디스플레이 방식
        NavigationStack {
            ScrollView(.horizontal,showsIndicators: false, content: {
                // 핃백: 광고가 자동으로 넘어가게 되면 좋겠다.
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: UIScreen.main.bounds.width * 3, height: 120)
                    .background(
                        HStack {
                            NavigationLink(destination: CatPostDetail()) {
                                Image("CatPost")
                                    .resizable()
                                    
                            }
                            NavigationLink(destination: JejuAiprPostDetail()) {
                                Image("JejuAiprPost")
                                    .resizable()
                                    
                            }
                            NavigationLink(destination: InsuranceAdDetail()) {
                                Image("InsuranceAd")
                                    .resizable()
                                    
                            }

                        })
                    
                }
            )
        }
    }
}

struct Advertising_Previews: PreviewProvider {
    static var previews: some View {
        Advertising()
    }
}
