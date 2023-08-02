//
//  ButtonDesignView.swift
//  NbbangAPP
//
//  Created by LJh on 2023/07/25.
//

import SwiftUI

struct ButtonDesignView: View {
    var body: some View {
      //MARK: - 돈을 계산하는 버튼의 이미지
      ZStack{
        Image("mbricash_99554")
          .fontWeight(.black)
      }.frame(width: 70,height: 70)
    }
}

struct ButtonDesignView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDesignView()
    }
}
