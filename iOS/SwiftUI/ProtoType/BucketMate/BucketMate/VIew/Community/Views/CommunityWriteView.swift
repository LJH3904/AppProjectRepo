//
//  CommunityWriteView.swift
//  BucketMate
//
//  Created by 유하은 on 2023/07/27.
//

import SwiftUI
import PhotosUI

struct CommunityWriteView: View {
    @State var isShowingSheet: Bool = false
    @State var title: String = ""
    @State var content: String = ""
    @EnvironmentObject var postStore: PostStore
    @Environment(\.presentationMode) var presentationMode
    @State var recruitPost: RecruitPost = RecruitPost(user: User(name: "rapunzel", imageUrlString: "rapunzel"), postImageString: "spain", country: "대한민국 🇰🇷", title: "", description: bundleDescription, requirement: bundleRequirement)
    
    var body: some View {
        ScrollView {
            HStack {
                Text("write")
                    .font(.system(size: 30))
                    .fontDesign(.rounded)
                    .bold()
                Image(systemName: "square.and.pencil")
                Spacer()
                Button {
                    isShowingSheet = true
                } label: {
                    Text("조건 선택")
                        .foregroundColor(Color.bucketColor)
                }
            }
            .padding(20)
            Group{
                Text("글 제목")
                    .padding(.trailing,300)
                    .bold()
                TextField("제목을 입력하세요", text: $recruitPost.title, axis: .vertical)
                    .padding(.leading,20)
                    .frame(height: 30)
                Text("사진 추가")
                    .padding(.trailing,290)
                    .bold()
                Image(recruitPost.postImageString)
                    .resizable()
                NavigationLink {
                    PictureSelectView(recruitPost: $recruitPost)
                } label: {
                    HStack{
                        Text("갤러리에서 가져오기")
                        Image(systemName: "folder.fill")
                    }
                }
                Text("글 내용")
                    .padding(.trailing,300)
                    .padding(.top,23)
                    .bold()
                TextField("글 내용을 입력하세요", text: $recruitPost.description, axis: .vertical)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .frame(height: 30)
            }
            Text("조건선택")
                .padding(.trailing,290)
                .padding(.top,23)
                .bold()
            /*
             var locationString: String
             var minBudget: Double
             var maxBudget: Double
             var firstDate: Date
             var lastDate: Date
             var gender: Gender
             var tendency: Tendency
             var purpose: Purpose
             var bucketList: BucketLis
             */
            Group{
                HStack{
                    Text("예산:")
                    Text(recruitPost.requirement.predictExpense)
                }
                HStack{
                    Text("날짜:")
                    Text(recruitPost.requirement.period)
                }
                HStack{
                    Text("성별:")
                    Text(recruitPost.requirement.gender.rawValue)
                }
                HStack{
                    Text("취향:")
                    Text(recruitPost.requirement.tendency.rawValue)
                }
                HStack{
                    Text("여행목적:")
                    Text(recruitPost.requirement.purpose.rawValue)
                }
                HStack{
                    Text("버킷리스트:")
                    Text(recruitPost.requirement.bucketList.rawValue)
                }
            }
            Spacer()
            Text("# 커뮤니티 사용 원칙에 위반되는 글은 삭제 될 수 있습니다.")
                .font(.system(size: 10))
                .foregroundColor(.red)
            HStack{
                Button("취소") {
                    presentationMode.wrappedValue.dismiss()
                }
                Spacer()
                Button("등록") {
                    presentationMode.wrappedValue.dismiss()
                    postStore.addNewPost(recruitPost)
                }
                .disabled(
                    recruitPost.title == "" ||
                    recruitPost.description == "" ||
                    recruitPost.requirement.gender == .none ||
                    recruitPost.requirement.tendency == .none ||
                    recruitPost.requirement.purpose == .none ||
                    recruitPost.requirement.bucketList == .none
                )
            }
            .padding(60)
        }
        .sheet(isPresented: $isShowingSheet) {
            RequirementView(requirement: $recruitPost.requirement, isPresented: $isShowingSheet) 
        }
    }
}
struct CommunityWriteView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{CommunityWriteView()
        }
        .environmentObject(PostStore())
    }
}
