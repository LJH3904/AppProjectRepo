//
//  BongPro.swift
//  Teamprofile
//
//  Created by 봉주헌 on 2023/06/27.
//

import SwiftUI

struct BongPro: View {
    var name: String
    @State var bongArray: [String] = ["봉주헌", "ISFP", "경기부천", "안녕하세요. 반갑습니다!", "이불 속", "이불 밖", "없습니다!!!"]
    
    var body: some View {
        NavigationStack{
             
             
             List{
               //MARK: - MBTI
               
               NavigationLink {
                 List{
                   Text("ISFP").font(.largeTitle).bold()
                   Text("성격 유형: 호기심 많은 예술가, 성인군자형").font(.system(size: 30))
                     .bold()
                   Text(
       """
       말없이 다정하고 온화하며 사람들에게 친절하고 상대방을 잘 알게 될 때까지 내면의 모습이 잘 보이지 않는다. 의견 충돌을 피하고, 인화를 중시한다. 인간과 관계되는 일을 할 때 자신의 감정과 타인의 감정에 지나치게 세심하고 민감한 경향이 있다. 이들은 결정력과 추진력을 기를 필요가 있을 것이다. 3차 기능인 Ni(내향 직관)으로 눈치가 빠르며, 조용히 자기 일만 하고 있는 것처럼 보이지만 사실 주변 상황파악도 다 하고 있다. 경험을 통해서 부기능 Se(외향 감각)과 함께 주기능 Fi(내향 감정)인 자신의 내면을 보호하는 데에 잘 사용할 수 있다.
       """)
                 }
               } label: {
                 
                 Image(systemName: "person.text.rectangle")
                   .imageScale(.large)
                 Text("MBTI")
                   .font(.largeTitle)
                 
               }
               
               //MARK: - 지역
               
               NavigationLink {
                 List{
                   Text("경기도 부천시").font(.system(size: 30))
                     .bold()
                   Image("Location")
                     .imageScale(.large)
                 }
               } label: {
                 Image(systemName:"location.magnifyingglass" )
                   .imageScale(.large)
                 Text("지역")
                   .font(.largeTitle)
               }
               
               //MARK: - 인사말
               
               NavigationLink {
                 Text("안녕하세요. 25살 남자 봉주헌입니다.")
                   .font(.system(size: 30))
                   .bold()
               } label: {
                 Image(systemName: "theatermask.and.paintbrush.fill")
                   .imageScale(.large)
                 Text("인사말")
                   .font(.largeTitle)
               }
               //MARK: - 좋아하는것
               
               NavigationLink {
                 Text("이불 속")
               } label: {
                 Image(systemName: "hand.thumbsup")
                   .imageScale(.large)
                 Text("좋아하는것")
                   .font(.largeTitle)
               }
               //MARK: - 싫어하는것
               
               NavigationLink {
                 Text("이불 밖") .font(.system(size: 30))
                   .bold()
                 Text("집 밖에 나가는 것을 좋아하지 않지만, 나가면 또 잘 노는 스타일입니다!")
                 
               } label: {
                 Image(systemName: "hand.thumbsdown")
                   .imageScale(.large)
                 Text("싫어하는거")
                   .font(.largeTitle)
               }
               //MARK: - 대표사진
               
               NavigationLink {
                 Image("ddage")
                   .imageScale(.large)
               } label: {
                 Image(systemName: "photo.artframe")
                   .imageScale(.large)
                 Text("대표사진")
                   .font(.largeTitle)
               }
               //MARK: - 애완동물
               
               NavigationLink {
                 Text("없어욤, 털 알러지가 있답니당")
                   .font(.system(size: 30))
                     .bold()
               } label: {
                 Image(systemName: "pawprint")
                   .imageScale(.large)
                 Text("애완동물")
                   .font(.largeTitle)
               }
             }
        }.navigationTitle("\(name)")
    }
}

struct BongPro_Previews: PreviewProvider {
    static var previews: some View {
        BongPro(name: "봉주헌")
    }
}
