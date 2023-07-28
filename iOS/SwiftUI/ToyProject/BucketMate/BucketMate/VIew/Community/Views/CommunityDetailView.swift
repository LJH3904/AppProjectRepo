//
//  ContentView.swift
//  ProtoType
//
//  Created by Aiden Park on 2023/07/27.
//

import SwiftUI

struct CommunityDetailView: View {
    @EnvironmentObject var postStore: PostStore
    var recruitPost: RecruitPost
    //    var imageString: String
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                
                
                // 게시글 배경 이미지
                Image(recruitPost.postImageString)
                    .resizable()
                    .frame(height: 250)
                //                AsyncImage(url: URL(string: recruitPost.postImageString)) { image in
                //                    image
                //                        .resizable()
                //                        .frame(height: 250)
                //                } placeholder: {
                //                    ProgressView()
                //                }
                // 제목, 국가,
                VStack(alignment: .leading){
                    Text(recruitPost.title)
                        .font(.system(size: 24, weight: .medium,design: .rounded))
                }
                .padding(20)
                
                HStack {
                    Spacer()
                    // 국가 입력받는 란
                    Text("Spain 🇪🇸")
                        .font(.system(size:14))
                    
                }.padding(.top,4)
                
                
            }
            .padding(10)
            Divider()
            // 호스트 이미지
            HStack{
                NavigationLink {
                    MyView()
                } label: {
                    
                    HStack {
                        Image(recruitPost.user.imageUrlString)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(12)
                            .frame(width: 80, height: 80)
                            .padding(.trailing,10)
                        
                        
                        VStack(alignment: .leading){
                            
                            Text("👑 Host")
                                .foregroundColor(.cyan)
                                .font(.system(size:14))
                            Text("Rapunzel")
                                .font(.system(size: 20, weight: .medium))
                            
                        }
                    }
                    
                }
                
                Spacer()
                
                
                
                HStack{
                    
                    NavigationLink {
                        ChatView(name: "Direct Message")
                    } label: {
                        Label(" ", image: "chat")
                        
                    }
                    .padding(.leading,10)
                }
                
            }
            .listStyle(.plain)
            .padding(20)
            
            Divider()
            
            HStack{
                Text("예상경비")
                Spacer()
                // 경비 금액 란
                Text("120 ~ 300만원")
            }.padding()
            
            HStack{
                Text("모집인원")
                Spacer()
                // 인원 모집란
                // 현재까지 모집된 인원의 글자 색은 grey로 설정
                Text("1")
                    .foregroundColor(.gray)
                Text("/ 4인")
            }.padding()
            
            HStack{
                Text("기간")
                Spacer()
                // 기간 설정란
                Text("2023.08.13 ~ 2023.08.15")
            }
            .padding()
            
            Spacer()
            
            // 선호하는 액티비티
            VStack(alignment: .leading){
                
                Text("선호하는 활동")
                    .padding(.leading,14)
                    .padding(.bottom, 20)
                
                HStack{
                    Text("익스트림 스포츠")
                        .foregroundColor(.white)
                        .font(.system(size:12,weight: .heavy))
                        .padding(10)
                        .background(Color.yellow)
                        .cornerRadius(20)
                        .padding(.leading, 20)
                    
                    Text("하이킹")
                        .foregroundColor(.white)
                        .font(.system(size:12,weight: .heavy))
                        .padding(10)
                        .background(Color.green)
                        .cornerRadius(20)
                    
                    Text("오지 체험")
                        .foregroundColor(.white)
                        .font(.system(size:12,weight: .heavy))
                        .padding(10)
                        .background(Color.cyan)
                        .cornerRadius(20)
                    
                    Text("이색 체험")
                        .foregroundColor(.white)
                        .font(.system(size:12,weight: .heavy))
                        .padding(10)
                        .background(Color.mint)
                        .cornerRadius(20)
                    
                }
                
                //                     채팅창으로 이어지는 버튼
                
                
                //                     채팅창으로 이어지는 버튼
            }
            
        }
    }
    
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CommunityDetailView(recruitPost: RecruitPost(user: User(name: "rapunzel", imageUrlString: "rapunzel"), postImageString: "https://image.newsis.com/2020/04/21/NISI20200421_0016275359_web.jpg", country: "🇪🇸 Spain", title: "⚽️ 캄프누 경기 보러 가실분!", description: bundleDescription, requirement: bundleRequirement))
            //            CommunityDetailView(imageString: "https://image.newsis.com/2020/04/21/NISI20200421_0016275359_web.jpg")
        }
        .environmentObject(PostStore())
    }
}
