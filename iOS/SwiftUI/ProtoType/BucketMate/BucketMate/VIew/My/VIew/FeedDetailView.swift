//
//  FeedDetailView.swift
//  BucketMate
//
//  Created by LJh on 2023/07/28.
//

import SwiftUI

extension Image {
  func set1Feed() -> some View {
    self
      .resizable()
      .aspectRatio(contentMode: .fill)
      .frame(width: 400,height: 500)
      .clipShape(Rectangle())
  }
  
}
struct FeedDetailView: View {
  
    var body: some View {
      
      VStack {
        Text("\(Date())")
        Image("feed1")
          .set1Feed()
        Text("대충 피드가 나오는 곳입니다 ~ ")
      }
       
    }
}

struct FeedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FeedDetailView()
    }
}
