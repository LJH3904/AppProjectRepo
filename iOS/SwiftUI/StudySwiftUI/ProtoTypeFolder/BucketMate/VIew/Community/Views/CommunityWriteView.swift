//
//  CommunityWriteView.swift
//  BucketMate
//
//  Created by 유하은 on 2023/07/27.
//

import SwiftUI

struct CommunityWriteView: View {
    @State var isShowingSheet: Bool = false
    @State var title: String = ""
    @State var content: String = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack{
            HStack{
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
                }
            }
            .padding(20)
            Text("글 제목")
                .padding(.trailing,300)
                .bold()
            TextField("제목을 입력하세요", text: $title, axis: .vertical)
                .padding(.leading,20)
                .frame(height: 30)
            Text("글 내용")
                .padding(.trailing,300)
                .padding(.top,23)
                .bold()
            TextField("글 내용을 입력하세요", text: $content, axis: .vertical)
                .padding(.leading,20)
                .padding(.trailing,20)
                .frame(height: 30)
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
                }
                .disabled(content == "" || title == "")
            }
            .padding(60)
            }
            .sheet(isPresented: $isShowingSheet) {
                RequirementView(isPresented: $isShowingSheet)
        }
    }
}
struct CommunityWriteView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityWriteView()
    }
}
