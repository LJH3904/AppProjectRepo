//
//  MotionAnimationView.swift
//  HikeApp
//
//  Created by LJh on 2023/08/04.
//

import SwiftUI

struct MotionAnimationView: View  {
  //MARK: - Propoties
  
  @State private var randomCircle : Int = Int.random(in: 6...12)
  @State private var isAnimating : Bool = false
  //MARK: - funcs
  
  //  1. Random coordinate
  func randomCoordinate() -> CGFloat {
    return CGFloat.random(in: 0...256)
  }
  //  2. Random Size
  func randomSize() -> CGFloat {
    return CGFloat(Int.random(in: 4...80))
  }
  //  3. Random scale
  func randomScale() -> CGFloat {
    return CGFloat(Double.random(in: 0.1...2.0))
  }
  //  4. Random speed
  func randomSpeed() -> Double {
    return Double.random(in: 0.05...1.0)
  }
  //  5. Random delay
  func randomDelay() -> Double {
    return Double.random(in: 0...2)
  }

 
    var body: some View {
      ZStack{
        ForEach(0...randomCircle,id: \.self) { item in
          Circle()
            .foregroundColor(.white)
            .opacity(0.25)
            .frame(width: randomSize())
            .position(x: randomCoordinate(),
                      y:randomCoordinate())
            .scaleEffect(isAnimating ? randomScale() : 1)
            .onAppear(perform: {
              withAnimation(
                .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                /*
                 주어진 시작 값과 최종 값 사이에서 스프링 애니메이션을 만들어주는 함수입니다. 스프링 애니메이션은 물리적인 스프링의 동작을 모방하여 부드럽게 움직이는 효과를 만들어줍니다.
                 */
                .repeatForever()
                .speed(randomSpeed())
                .delay(randomDelay())
              ) {
                isAnimating = true
              }
            }
          )
        }
        
      }// : ZSTACK
      .frame(width: 256,height: 256)
      .mask(Circle())
      .drawingGroup()
      // 렌더링 최적화
      //낭비하면 메모리붐 ㅋㅋ
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
      MotionAnimationView()
        .background(
        Circle()
          .fill(.teal)
        )
        
    }
}
