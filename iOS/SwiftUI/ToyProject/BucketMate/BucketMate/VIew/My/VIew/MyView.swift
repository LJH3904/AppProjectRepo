//
//  MyView.swift
//  BucketMate
//
//  Created by 유하은 on 2023/07/27.
//

import SwiftUI



extension Text {
  func robotoFont (settingSize : Int) -> some View{
    self
      .font(Font.custom("Roboto", size: CGFloat(settingSize)))
    
    // 먼저 색을 넣으면 다음은 변경이 안된다?
  }
}
extension Button{
  func setBlack () -> some View{
    self
      .foregroundColor(.black)
  }
}

struct MyView: View {
  var hashTagStore : HashTagStore = HashTagStore()
  @ObservedObject var memberStore : MemberStore = MemberStore()
  
  let layout = [
    GridItem(.adaptive(minimum: 100))
  ]
 
  let image : MemberStore = MemberStore()
  
  @State var swichView : Bool = true
  
  var body: some View {
    VStack{
      HStack{
        Image("MGM")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 70,height: 70)
          .clipShape(Circle())
        VStack{
          HStack {
            Text("마경미")
              .robotoFont(settingSize: 20)
              .bold()
            Spacer()
          }.multilineTextAlignment(.leading)
          HStack {
            Text("@MGM1234")
              .foregroundColor(Color.gray)
            Spacer()
          }
          HStack {
            Text("여행을 가고싶은 마경미 입니다.")
              .robotoFont(settingSize: 15)
            Spacer()
          }
        }
      }
      ScrollView(.horizontal) {
        LazyHGrid(rows: layout) {
          ForEach(hashTagStore.hashTagStore) { place in
            Button(action: {},
                   label:{
              VStack {
                RoundedRectangle(cornerRadius: 20)
                  .foregroundColor(place.hashTagColors)
                  .frame(minWidth: 80,maxHeight: 30)
                  .overlay {
                    Text(" \(place.hashTag)")
                      .robotoFont(settingSize: 10)
                      .multilineTextAlignment(.leading)
                      .padding(10)
                  }
              }
            }// : Label
            ).setBlack()
              .padding(.horizontal, 12)
          }
        }
        .padding(.horizontal, 13)
        .frame(height: 117)
      }
      VStack {
        HStack{
          Button {
            swichView = true
          } label: {
            Text("피드")
              .robotoFont(settingSize: 20)
              .padding()
          }.setBlack()
          Button {
            swichView = false
          } label: {
            Text("구인공고")
              .robotoFont(settingSize: 20)
              .padding()
          }.setBlack()
        }
        Divider()
          .frame(minHeight: 3)
          .overlay(Color.grayMedium)
      }
      Spacer()
      
      if swichView {
        FeedView()
      }else{
        ScrollView{
          RecruitListView()
        }
      }
      
    }.padding(.horizontal,10)
      .toolbar {
        NavigationLink {
          MySettingView()
        } label: {
          Image(systemName: "text.justify")
        }
      }
  }
}

struct MyView_Previews: PreviewProvider {
  static var previews: some View {
    MyView()
  }
}
