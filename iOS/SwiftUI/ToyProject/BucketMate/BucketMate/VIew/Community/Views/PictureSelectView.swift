//
//  PictureSelectView.swift
//  BucketMate
//
//  Created by 유하은 on 2023/07/28.
//
import SwiftUI

struct PictureSelectView: View {
    var pictures = ["pic1", "pic2", "pic3", "pic4", "pic5", "pic6"]
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @EnvironmentObject var postStore: PostStore
    @Environment(\.presentationMode) var presentationMode
    @State var nowViewPicture: String = ""
    @Binding var recruitPost: RecruitPost
    
    var body: some View {
        VStack {
            Text("갤러리")
                .font(.system(size: 30))
                .bold()
                .padding(.top, 20)
            
            LazyVGrid(columns: gridItems, spacing: 20) {
                ForEach(pictures, id: \.self) { picture in
                    VStack {
                        Button {
                            nowViewPicture = picture
                        } label: {
                            ZStack{
                                Image(picture)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                if nowViewPicture == picture {
                                    Image(systemName: "checkmark")
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                }
            }
            
            HStack{
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                 Text("취소")
                }
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
//                    nowPictures.imageString = nowViewPicture
                    recruitPost.postImageString = nowViewPicture
                }) {
                 Text("완료")
                }
            }
            .padding(50)
        }//Vstack
    }
}

struct PictureSelectView_Previews: PreviewProvider {
    static var previews: some View {
        PictureSelectView(recruitPost: .constant(RecruitPost(user: User(name: "rapunzel", imageUrlString: "Rapunzel"), postImageString: "https://image.newsis.com/2020/04/21/NISI20200421_0016275359_web.jpg", country: "🇪🇸 Spain", title: "⚽️ 캄프누 경기 보러 가실분!", description: bundleDescription, requirement: bundleRequirement)))
            .environmentObject(PostStore())
    }
}
