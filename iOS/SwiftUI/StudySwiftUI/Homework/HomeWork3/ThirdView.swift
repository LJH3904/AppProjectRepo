//
//  ThirdView.swift
//  HomeWork3
//
//  Created by LJh on 2023/08/01.
//

import SwiftUI

struct ThirdView: View {
    var body: some View {
      ZStack {
        Color(.brown).ignoresSafeArea()
        VStack {
          Text("사용방법")
            .SetCountViewTextDesign()
          Text("누르면 카운트가 올라갑니다.")
            .SetCountViewTextDesign()
          Text("만든사람 이제현")
            .SetCountViewTextDesign()
        }
      }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
