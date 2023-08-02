//
//  CommunityCellView.swift
//  BucketMate
//
//  Created by gnksbm on 2023/07/28.
//

import SwiftUI

struct CommunityCellView: View {
    var recruitPost: RecruitPost
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .frame(height: 180)
                .overlay(
                    VStack {
                        VStack {
                            HStack {
                                VStack {
                                    HStack {
                                        Text(recruitPost.country)
                                            .font(
                                                Font.custom("Roboto", size: 12)
                                                    .weight(.medium)
                                            )
                                            .foregroundColor(.black)
                                        Spacer()
                                    }
                                    HStack {
                                        Text(recruitPost.title)
                                            .font(
                                                Font.custom("Roboto", size: 14)
                                                    .weight(.semibold)
                                            )
                                            .foregroundColor(.black)
                                        Spacer()
                                    }
                                }
                                HStack {
                                    Image(recruitPost.user.imageUrlString)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 25, height: 25)
                                        
                                        .clipShape(Circle())
                                    Text(recruitPost.user.name)
                                        .font(Font.custom("Roboto", size: 13))
                                        .kerning(0.41)
                                        .foregroundColor(.black)
                                }
                                
                            }
                            Spacer(minLength: 10)
                            HStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 140, height: 100)
                                    .background(
                                        Image(recruitPost.postImageString)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
//                                        AsyncImage(url: URL(string: "https://d3b39vpyptsv01.cloudfront.net/photo/1/2/92cb6276cc547053db7fda361d46d1bf.jpg"), content: {image in
//                                            image.resizable()
//                                        }, placeholder: {
//                                            ProgressView()
//                                        })
                                    )
                                    
                                    .cornerRadius(10)
                                Spacer(minLength: 15)
                                VStack {
                                    HStack {
                                        Text("예상 날짜 ")
                                            .font(
                                                Font.custom("Roboto", size: 12)
                                                    .weight(.thin)
                                            )
                                            .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
                                        Spacer()
                                        Text(recruitPost.requirement.period)
                                            .font(Font.custom("Roboto", size: 12))
                                            .foregroundColor(Color(red: 0.48, green: 0.48, blue: 0.48))
                                    }
                                    HStack {
                                        Text("예상 경비")
                                            .font(
                                                Font.custom("Roboto", size: 12)
                                                    .weight(.thin)
                                            )
                                            .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
                                        Spacer()
                                        Text(recruitPost.requirement.predictExpense)
                                            .font(Font.custom("Roboto", size: 12))
                                            .foregroundColor(Color(red: 0.48, green: 0.48, blue: 0.48))
                                    }
                                    HStack {
                                        Text("모집인원")
                                            .font(
                                                Font.custom("Roboto", size: 12)
                                                    .weight(.thin)
                                            )
                                            .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
                                        Spacer()
                                        Text("1 ~ 4인")
                                            .font(Font.custom("Roboto", size: 12))
                                            .foregroundColor(Color(red: 0.48, green: 0.48, blue: 0.48))
                                    }
                                    HStack {
                                        Text("기간")
                                            .font(
                                                Font.custom("Roboto", size: 12)
                                                    .weight(.thin)
                                            )
                                            .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
                                        Spacer()
                                        Text(recruitPost.requirement.period)
                                            .font(Font.custom("Roboto", size: 12))
                                            .foregroundColor(Color(red: 0.48, green: 0.48, blue: 0.48))
                                    }
                                }
                            }
                        }.padding(15)
                    })
                .padding(.horizontal,25)
                .padding(.vertical, 12)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.25), radius: 3, x: 0, y: 2)
                .cornerRadius(10)
            
        }
    }
}

struct CommunityCellView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityCellView(recruitPost: RecruitPost(user: User(name: "rapunzel", imageUrlString: "Rapunzel"), postImageString: "pic1", country: "🇪🇸 Spain", title: "⚽️ 캄프누 경기 보러 가실분!", description: bundleDescription, requirement: bundleRequirement))
    }
}
