//
//  GradientButtonStyle.swift
//  HikeApp
//
//  Created by LJh on 2023/08/04.
//

import Foundation
import SwiftUI

struct GradientButton : ButtonStyle{
  func makeBody(configuration: Configuration) -> some View {
    configuration
      .label
      .padding(.vertical)
      .padding(.horizontal, 30)
      .background(
        
       
        configuration.isPressed ?
        // A : 버튼 누름
        LinearGradient(colors: [Color.customGrayMedium,.customGrayLight], startPoint: .top, endPoint: .bottom)
        :
          // B : 버튼 안누름
        LinearGradient(colors: [Color.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom)
      )
      .cornerRadius(40)
    
  }
}
