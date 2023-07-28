//
//  RecruitListView.swift
//  BucketMate
//
//  Created by 마경미 on 27.07.23.
//

import Foundation
import SwiftUI

struct RecruitListView: View {
    var body: some View {
        VStack {
            ForEach(recruits, content: { recruit in
                NavigationLink {
                    CommunityDetailView(imageString: recruit.countryImage)
                } label: {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .frame(height: 180)
                        .overlay(
                            VStack {
                                VStack {
                                    HStack {
                                        VStack {
                                            HStack {
                                                Text(recruit.country)
                                                    .font(
                                                        Font.custom("Roboto", size: 12)
                                                            .weight(.medium)
                                                    )
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }
                                            HStack {
                                                Text(recruit.title)
                                                    .font(
                                                        Font.custom("Roboto", size: 14)
                                                            .weight(.semibold)
                                                    )
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }
                                        }
                                        HStack {
                                            Image(recruit.writerImage)
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .clipShape(Circle())
                                            Text(recruit.writer)
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
                                                AsyncImage(url: URL(string: recruit.countryImage), content: {image in
                                                    image.resizable()
                                                }, placeholder: {
                                                    ProgressView()
                                                }
                                                          ))
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
                                                Text(recruit.predictDate)
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
                                                Text(recruit.predictExpense)
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
                                                Text(recruit.recruitNumber)
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
                                                Text(recruit.period)
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
            })
        }
    }
}

struct RecruitListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RecruitListView()
        }
    }
}
