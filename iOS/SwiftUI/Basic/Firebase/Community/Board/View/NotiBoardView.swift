//
//  NotiBoardView.swift
//  Board
//
//  Created by 변상필 on 2023/08/18.
//

import SwiftUI

struct NotiBoardView: View {
    @ObservedObject var contentStore = ContentStore()
    
    var body: some View {
        ScrollView(.vertical){
            ForEach(contentStore.notiContents) { content in
                VStack {
                    HStack{
                        Text(content.title)
                            .font(.title)
                        
                        VStack{
                            Text(content.username)
                                .font(.headline)
                            Text(content.createdDate)
                        }
                    }
                    Text(content.article)
                        .font(.body)
                    Divider()
                }
                .multilineTextAlignment(.center)
                .padding()
            }
            

            

        }
        .onAppear {
            contentStore.fetchContents(DBname: "공지사항")
        }
    }
    
}


struct NotiBoardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NotiBoardView()
        }
    }
}
