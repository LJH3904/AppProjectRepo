//
//  MemberListView.swift
//  RandomMember
//
//  Created by LJh on 2023/07/06.
//

import SwiftUI
import AVFoundation

struct MemberListView: View {
  
  @ObservedObject var memberStore : MemberStore = MemberStore()
  //memberStore에 PUBLISED 라고 속성래퍼로 감싸있는 값이 변경이 되면 @ObservedObject memberStore 현제 바뀐값으로 바꿔준다.
  @State var isShowingSheet : Bool = false
  @State var isShowingAlert : Bool = false
  
  var body: some View {
   
      VStack{
        List(memberStore.members){ member in
          HStack{
            Text("\(member.name)")
            Spacer()
            Button("\(Image(systemName:"person.fill.badge.minus"))"){
              memberStore.deleteMember(member)
            }
          }
        }
        
        MemberPickButtonView(memberStore: memberStore)
      }
      .navigationTitle("Members")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            isShowingAlert = true
            
          } label: {
            Label("전체삭제", systemImage: "trash.fill")
              .disabled(memberStore.membersEmpty)
          }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            isShowingSheet = true
          } label: {
            //라벨에 추가라는 텍스트는 접근성 떄문이다
            //시각장애인은 청각에 의존하기 때문이다.
            Label("추가", systemImage: "person.fill.badge.plus")
          }
        }
        
      }
      .sheet(isPresented: $isShowingSheet) {
        MemberAddView(memberStore : memberStore ,isShowingSheet: $isShowingSheet)
      }
      .alert(isPresented: $isShowingAlert) {
        Alert(title: Text("진짜 삭제 할거에요?") , message: Text("진짠데") , primaryButton: .destructive(Text("삭제")){
          memberStore.removeMembersAll()
        },secondaryButton: .cancel(Text("취소")))}
    }
  
}

struct MemberListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack{ // 프로토타이핑에 의존성 주입
      MemberListView()
    }
  }
}
