//
//  HomeView.swift
//  BucketMate
//
//  Created by 유하은 on 2023/07/27.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack {
                PlaceGridView()
                HomeTitle(title: "Popular")
                PopularPostsView()
                Spacer(minLength: 40)
                HomeTitle(title: "Current Recruit")
                RecruitListView()
            }
        }
        .navigationTitle("Bucket Mate")
        .toolbar {
            NavigationLink {
                MyView()
            } label: {
                Image("rapunzel")
                    .resizable()
                    .frame(width: 38, height: 38)
                    .clipShape(Circle())
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
        }
    }
}
