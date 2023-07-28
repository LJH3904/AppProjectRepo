//
//  MySettingView.swift
//  BucketMate
//
//  Created by 유하은 on 2023/07/27.
//

import SwiftUI

struct MySettingView: View {
    var body: some View {
      List{
        Text("설정 및 개인정보")
        Text("내 구인활동")
          Text("보관")
          Text("친구")
          Text("즐겨찾기")
        Text("시간이없어요..")
          .bold()
          .font(.system(size: 100))

      }
    }
}

struct MySettingView_Previews: PreviewProvider {
    static var previews: some View {
        MySettingView()
    }
}
