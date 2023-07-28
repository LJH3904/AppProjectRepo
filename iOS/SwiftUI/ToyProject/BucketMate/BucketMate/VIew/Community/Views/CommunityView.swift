//
//  CommunityView.swift
//  BucketMate
//
//  Created by 유하은 on 2023/07/27.
//

import SwiftUI

struct CommunityView: View {
    let imageNames: [String] = ["SpainPost", "IrelandPost", "ItalyPost", "TurkeyPost", "FinlandPost", "SpainPost", "IrelandPost", "ItalyPost", "TurkeyPost", "FinlandPost",]
    let gridItems: [GridItem] = [GridItem()]
    
    @EnvironmentObject var postStore: PostStore
    
    @State var selectedName = "전체보기"
    @State var isSecondCategory = false
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyHGrid(rows: gridItems) {
                    ForEach(MainCategory.allCases, id: \.self) { category in
                        Button(category.toString) {
                            selectedName = category.toString
                        }
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(category.toString == selectedName ? .white : .black)
                        .frame(width: 64, height: 26)
                        .background(category.toString == selectedName ? Color.bucketColor : .white)
                        .cornerRadius(10)
                    }
                }
                .padding()
                VStack {
                    ForEach(postStore.postList) { post in
                        NavigationLink {
                            CommunityDetailView(recruitPost: post)
                        } label: {
                            CommunityCellView(recruitPost: post)
                        }
                    }
                }
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink {
                        CommunityWriteView()
                    } label: {
                        Image("AddNewPostbutton")
                    }
                    .padding(.trailing, 30)
                }
            }
        }
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CommunityView()
        }
        .environmentObject(PostStore())
    }
}


