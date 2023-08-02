//
//  PeedView.swift
//  BucketMate
//
//  Created by LJh on 2023/07/28.
//

import SwiftUI

extension Image {
  func setFeed() -> some View {
    self
      .resizable()
      .aspectRatio(contentMode: .fill)
      .frame(width: 100,height: 100)
      .clipShape(Rectangle())
  }
  
}

struct FeedView: View {
  
  let layoutPeed = [
    GridItem(.adaptive(minimum: 60)),
    GridItem(.adaptive(minimum: 60)),
    GridItem(.adaptive(minimum: 60))
  ]
  
   let feeds : [String] = [
    "feed1","feed2","feed3","feed4","feed11",
    "feed21","feed31","feed41"
  ]
  
    var body: some View {
      ScrollView(.vertical){
        LazyVGrid(columns: layoutPeed) {
          ForEach(feeds,id: \.self){ image in
            NavigationLink {
              FeedDetailView()
            } label: {
              Image(image).setFeed()
            }

            
          }
        }
      }
      
    }
}

struct PeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
