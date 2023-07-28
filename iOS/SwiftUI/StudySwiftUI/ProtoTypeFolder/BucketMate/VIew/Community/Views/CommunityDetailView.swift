//
//  ContentView.swift
//  ProtoType
//
//  Created by Aiden Park on 2023/07/27.
//





import SwiftUI

struct CommunityDetailView: View {
    var imageString: String
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                
                
                // 게시글 배경 이미지
                AsyncImage(url: URL(string: imageString)) { image in
                    image
                    .resizable()
                    .frame(height: 250)
                } placeholder: {
                    ProgressView()
                }
                // 제목, 국가,
                VStack(alignment: .leading){
                    Text("⚽️ 캄프누 경기 보러 가실분!")
                        .font(.system(size: 24, weight: .medium,design: .rounded))
                    
                    HStack {
                        Text("Spain 🇪🇸")
                            .padding(.top,4)
                        Spacer()
                        Text("⭐️ 4.5")
                    }
                    
                    
                }
                .padding(20)
                
                Divider()
                
                
                
                // 호스트 이미지
                HStack{
                    Image("rapunzel")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .padding(.trailing,10)
                    
                    
                    VStack(alignment: .leading){
                        
                        Text("Host")
                            .foregroundColor(.cyan)
                        Text("Rapunzel")
                            .font(.system(size: 20, weight: .medium))
                        
                    }
                    
                    Spacer()


                    
                    HStack{
                        
                        Button {
                            // 채팅창으로 이어지는 버튼
                            // 제현님 채팅창과 연결?
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
                    Text("120 ~ 300만원")
                }.padding()
                
                HStack{
                    Text("모집인원")
                    Spacer()
                    Text("1인~4인")
                }.padding()
                
                HStack{
                    Text("기간")
                    Spacer()
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
                        
                        Text("이색 스포츠")
                            .foregroundColor(.white)
                            .font(.system(size:12,weight: .heavy))
                            .padding(10)
                            .background(Color.cyan)
                            .cornerRadius(20)
                        
                    }
                    
//                     채팅창으로 이어지는 버튼


                    
                }
                
            }
        }
        
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityDetailView(imageString: "https://image.newsis.com/2020/04/21/NISI20200421_0016275359_web.jpg")
    }
}
