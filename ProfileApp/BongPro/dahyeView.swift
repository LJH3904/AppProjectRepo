//
//  dahyeView.swift
//  BongPro
//
//  Created by 봉주헌 on 2023/06/27.
//

import Foundation

import SwiftUI

struct dahyeView: View {
    var name: String // 초기화될 내용은 호출하시는 분이 알려주실거임
    
    struct profile{
        var myMbti : String
        var myArea : String
        var hello : String
        var myLike : String
        var myHate : String
        var photo : Image
        var my : String
        
        init(){
            self.myMbti  = "ENTP"
            self.myArea = "서울 신림이용"
            self.hello = "모두들 반가워용~~~~^-^****"
            self.myLike = "맛집탐방과 반주"
            self.myHate = "하루죙일 누워있기"
            self.photo = Image("IMG_2589 2")
            self.my = "X"
        }
    }
    
    
    var dahye : profile = profile()
    
    var body: some View {
        NavigationStack{
            
            List{
                //MARK: - MBTI
                
                NavigationLink {
                    List{
                        Text("\(dahye.myMbti)").font(.largeTitle).bold()
                        Text("성격 유형: 논리술사").font(.system(size: 30))
                            .bold()
                        Text(
  """
  변론가(ENTP)는 두뇌 회전이 빠르고 대담한 성격으로 현재 상황에 이의를 제기하는 데 거리낌이 없습니다. 변론가는 어떤 의견이나 사람에 반대하는 일을 두려워하지 않으며, 논란이 될 만한 주제에 대해 격렬하게 논쟁하는 일을 즐깁니다.
  
  그렇다고 변론가가 반론을 제기하는 데만 관심이 있거나 악의를 지닌 것은 아닙니다. 사실 변론가는 지식이 풍부하고 호기심이 넘치며 활기찬 유머 감각으로 다른 사람을 즐겁게 할 수 있는 성격입니다. 다만 대부분의 성격과 달리 논쟁에서 즐거움을 찾는 성향이 있을 뿐입니다.
  """)
                        
                        
                        Image("entp")
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
                        Text("\(dahye.myArea)").font(.system(size: 30))
                            .bold()
                        Image("sinlim")
                            .imageScale(.small)
                    }
                } label: {
                    Image(systemName:"location.magnifyingglass" )
                        .imageScale(.large)
                    Text("지역")
                        .font(.largeTitle)
                }
                
                //MARK: - 인사말
                
                NavigationLink {
                    Text("\(dahye.hello)")
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
                    Text("\(dahye.myLike)").font(.system(size: 30))
                        .bold()
                } label: {
                    Image(systemName: "hand.thumbsup")
                        .imageScale(.large)
                    Text("좋아하는것")
                        .font(.largeTitle)
                }
                //MARK: - 싫어하는것
                
                NavigationLink {
                    Text("\(dahye.myHate)") .font(.system(size: 30))
                        .bold()
                    Text("밖이 좋아요~~!")
                    
                } label: {
                    Image(systemName: "hand.thumbsdown")
                        .imageScale(.large)
                    Text("싫어하는거")
                        .font(.largeTitle)
                }
                //MARK: - 대표사진
                
                NavigationLink {
                    dahye.photo
                        .resizable().frame(maxWidth: 400,maxHeight: 250)
                    Text("기여운 아유니 하튜하튜 앙").bold()
                } label: {
                    Image(systemName: "photo.artframe")
                        .imageScale(.large)
                    Text("대표사진")
                        .font(.largeTitle)
                }
                //MARK: - 애완동물
                
                NavigationLink {
                    Text("\(dahye.my)")
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

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        dahyeView(name: "정다혜")
    }
}


