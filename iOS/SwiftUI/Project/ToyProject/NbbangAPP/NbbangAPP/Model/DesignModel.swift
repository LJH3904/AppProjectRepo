//
//  DesignModel.swift
//  NbbangAPP
//
//  Created by LJh on 2023/07/26.
//

import Foundation
import SwiftUI
struct DesignModel {
  func showLine() -> some View{
    Rectangle()
      .frame(width: 370, height: 2) // 선의 길이와 두께를 조절합니다.
      .foregroundColor(.black) // 선의 색상을 지정합니다.
  }
}
