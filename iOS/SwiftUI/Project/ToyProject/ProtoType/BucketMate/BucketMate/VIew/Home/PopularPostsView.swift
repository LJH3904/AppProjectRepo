//
//  PopularPostsView.swift
//  BucketMate
//
//  Created by 마경미 on 27.07.23.
//

import Foundation
import SwiftUI

struct PopularPostsView: View{
    let layout = [
        GridItem(.adaptive(minimum: 320))
    ]
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal,showsIndicators: false, content: {
                LazyHGrid(rows: layout) {
                    ForEach(posts) { post in
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 320, height: 240)
                                .background(
                                    ZStack {
                                        AsyncImage(url: URL(string: post.imageUrl), content: { image in
                                            image.resizable()
                                        }, placeholder: {
                                            ProgressView()
                                        })
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 320, height:240)
                                        .clipped()
                                        VStack {
                                            Spacer()
                                            HStack {
                                                VStack {
                                                    HStack {
                                                        Text(post.title)
                                                            .font(
                                                                Font.custom("Roboto-Bold", size: 13)
                                                                    .weight(.bold)
                                                            )
                                                            .foregroundColor(.white)
                                                        Spacer()
                                                    }
                                                    HStack {
                                                        Image(post.writerImage)
                                                            .resizable()
                                                            .frame(width: 25, height: 25)
                                                            .clipShape(Circle())
                                                        Text(post.writer)
                                                            .font(Font.custom("Roboto", size: 13))
                                                            .kerning(0.41)
                                                            .foregroundColor(.white)
                                                        Spacer()
                                                    }
                                                }.frame(height: 50)
                                                NavigationLink(destination: PostView(post: post), label: {
                                                    Image(systemName: "arrow.up.right")
                                                        .foregroundColor(.white)
                                                        .frame(width: 44, height: 44)
                                                        .background(Color("Main"))
                                                        .clipShape(Circle())
                                                })
                                            }
                                        }.padding(15)
                                            .frame(width: 320, height:240)
                                    }
                                )
                                .cornerRadius(20)
                        }
                    }
                }.padding(.horizontal, 25)
            })
        }
    }
}

struct PopularPostsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PopularPostsView()
        }
    }
}
