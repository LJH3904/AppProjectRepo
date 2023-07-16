//
//  MonsterView.swift
//  Homework
//
//  Created by LJh on 2023/07/17.
//

import SwiftUI

struct MonsterView: View {
  @ObservedObject var monsterStore : MonsterStore = MonsterStore()
  
  @State var isShowingSheet = false
  /* 
   AsyncImage(url: URL(string: "https://mybarcodeserver.ch/label.php?name1=\(name)&name2=\(name2)&pobox=&street=\(street)&number=\(number)&zip=\(zip)&city=\(city)&fragile=f&economy=f&signature=f")) { phase in
                       switch phase {
                           case .empty:
                               ProgressView()
                           case .success(let image):
                               image.resizable()
                                    .aspectRatio(contentMode: .fit)
   //                                 .frame(maxWidth: 500, maxHeight: 350)
                           case .failure:
                               Image(systemName: "photo")
                           @unknown default:
                               EmptyView()
                           }
                   }
   */
  var body: some View {
    NavigationView{
      VStack {
        
          List{
            ForEach(monsterStore.choiceMonster){idx in
              HStack{
                
                //MARK: - 궁금한거
    //괴물들의 리스트뷰를 만들어서 나타내었는데 그 괴물들의 이미지의 대한 주소를 가져오지만 데이터양이 많아져서 전부 그리지 못하고 있습니다.
    // 문제의 코드
//                AsyncImage(url: idx.locationURL) { image in
//                  image
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 40, height: 40)
//                    .clipShape(Circle())
//                } placeholder: {
//                  ProgressView()
//                }
//           하지만 placeholder에 이미지뷰를 넣었더니 됩니다.
//          다른점이라곤 progressView와 image뷰 차이인데 왜일까요?
                AsyncImage(url: idx.locationURL) { image in
                  image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                } placeholder: {
                  Image(systemName: "photo.circle.fill")
                      .resizable()
                      .scaledToFit()
                      .frame(maxWidth: 40)
                      .foregroundColor(.purple)
                      .opacity(0.5)
                }
                Text("\(idx.name)")
                //없을때 기본값 보여주기
                
                Spacer()
                
                Button {
                  monsterStore.deleteMonster(monster: idx)
                } label: {
                  Image(systemName: "minus.square")
                    .foregroundColor(.blue)
                }
                
              }
            }
          }
        
      }.navigationTitle("Monster")
      //MARK: - 툴바
        .toolbar{
          ToolbarItem(placement: .navigationBarLeading) {
            Button {
              isShowingSheet = true
            } label: {
              Text("추가")
                .bold()
            }
          }
          ToolbarItem(placement:.navigationBarTrailing) {
            Button {
              monsterStore.shuffled()
            } label: {
              Text("줄세우기")
                .bold()
            }
          }
          ToolbarItem(placement: .bottomBar) {
            Button {
              monsterStore.insertAll()
            } label: {
              Text("전부가져오기")
                .bold()
            }
          }
          ToolbarItem(placement: .bottomBar) {
            Button {
              monsterStore.resetMonster()
            } label: {
              Text("전부삭제")
                .bold()
            }
          }
        }
        .sheet(isPresented: $isShowingSheet) {
          MonsterListView(monsterStore: monsterStore,isShowingSheet: $isShowingSheet)
        }
    } // NavigationView
  }
}

struct MonsterView_Previews: PreviewProvider {
    static var previews: some View {
        MonsterView()
    }
}
