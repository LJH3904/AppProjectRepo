//
//  CustomCircleView.swift
//  HikeApp
//
//  Created by LJh on 2023/08/04.
//

import SwiftUI

struct CustomCircleView: View {
  @State private var isAnimateGradient : Bool = false
  
  
  var body: some View {
    ZStack {
      Circle()
        .fill(
          LinearGradient(
            colors:[
            .customIndigoMedium,
            .customSalmonLight],
            startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
            endPoint: isAnimateGradient ? .bottomLeading : .topTrailing
            )
          )
        .onAppear(){
          withAnimation(
            .linear(
              duration: 3.0
            ).repeatForever(autoreverses: true)
          ) {
            isAnimateGradient.toggle()
          }
        }
      MotionAnimationView()
    }// :ZSTACK
    .frame(width: 256,height: 256)
  }
}

struct CustomCircleView_Previews: PreviewProvider {
  static var previews: some View {
    CustomCircleView()
  }
}
