//
//  RecruitListView.swift
//  BucketMate
//
//  Created by 마경미 on 27.07.23.
//

import Foundation
import SwiftUI

struct RecruitListView: View {
    @EnvironmentObject var postStore: PostStore
    
    var body: some View {
        VStack {
            ForEach(postStore.postList, content: { post in
                NavigationLink {
                    CommunityDetailView(recruitPost: post)
                } label: {
                    CommunityCellView(recruitPost: post)
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
        .environmentObject(PostStore())
    }
}
