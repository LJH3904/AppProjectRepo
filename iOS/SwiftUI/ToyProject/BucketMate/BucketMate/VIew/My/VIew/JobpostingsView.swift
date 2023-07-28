//
//  JobpostingsView.swift
//  BucketMate
//
//  Created by LJh on 2023/07/28.
//

import SwiftUI

struct JobpostingsView: View {
  let layoutPeed = [
    GridItem(.adaptive(minimum: 60)),
    GridItem(.adaptive(minimum: 60)),
    GridItem(.adaptive(minimum: 60))
  ]
    var body: some View {
      ScrollView(.vertical){
        LazyVGrid(columns: layoutPeed) {
          Image("LJH")
          Image("LJH")
          Image("LJH")
          Image("LJH")
          Image("LJH")
          Image("LJH")
          Image("LJH")
          Image("LJH")
          Image("LJH")
        }
      }
    }
}

struct JobpostingsView_Previews: PreviewProvider {
    static var previews: some View {
        JobpostingsView()
    }
}
