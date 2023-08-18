//
//  BoardView.swift
//  Board
//
//  Created by 변상필 on 2023/08/18.
//

import SwiftUI

struct CommunityView: View {
    @ObservedObject var contentStore: ContentStore = ContentStore()
    
    
    var body: some View {
            List {
                ForEach(contentStore.communityContents) { content in
                    NavigationLink {
                        DetailView(content: content)
                    } label: {
                        HStack{
                            Text(content.title)
                            Text(content.username)
                            Button {
                                contentStore.removeContent(content, DBname: "자유게시판")

                            } label: {
                                    Text("삭제")
                            }

                        }
                    }
                    
                }
 
                Button {
                    contentStore.addContent(Content(username: "test", title: "test", article: "test"), DBname: "자유게시판")
                } label: {
                     Text("add")
                }
                
            }
            .listStyle(.plain)
            .refreshable {
                contentStore.fetchContents(DBname: "자유게시판")
            }
            
        .onAppear {
            contentStore.fetchContents(DBname: "자유게시판")
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("자유게시판")
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CommunityView()
        }
    }
}
