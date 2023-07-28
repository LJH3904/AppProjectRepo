//
//  PostView.swift
//  BucketMate
//
//  Created by 마경미 on 27.07.23.
//

import SwiftUI

struct PostView: View {
    var post: Post
    var body: some View {
        ScrollView {
            VStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 438)
                    .background(
                        AsyncImage(url: URL(string: post.imageUrl), content: { image in
                            image.resizable()
                        }, placeholder: {
                            ProgressView()
                        })
                    )
                    .cornerRadius(20)
                    .padding(.horizontal, 25)
                
                HStack {
                    VStack {
                        Image(post.writerImage)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        Text(post.writer)
                            .font(Font.custom("Baloo", size: 10))
                            .foregroundColor(.black)
                    }.frame(width: 50)
                    Spacer()
                    Text(post.title)
                        .frame(alignment: .leading)
                        .font(
                            Font.custom("Roboto", size: 20)
                                .weight(.bold)
                        ).foregroundColor(.black)
                }.padding(25)
                Text(post.description)
                  .font(
                    Font.custom("Roboto", size: 20)
                      .weight(.light)
                  )
                  .foregroundColor(.black)
                  .padding(.horizontal, 25)
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(imageUrl: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAyMjhfMzkg%2FMDAxNjc3NTcwNjM4ODI2.oigZx2mjdX0U7v1XQYs5WiSHVSdzpvG7G7tZAtnl2esg.D0icagY0gwVpmMI_UJapBnskEZOpcGjJaKrtQ8eL6Xsg.PNG.hotel-tour%2F%25B9%25E8%25B0%25E614.png&type=sc960_832", title: "신혼여행 추천, 발리", writerImage: "rapunzel", writer: "Rapunzel", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."))
    }
}
