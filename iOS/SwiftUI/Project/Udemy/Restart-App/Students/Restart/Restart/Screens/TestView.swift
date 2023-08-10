//
//  TestView.swift
//  Restart
//
//  Created by LJh on 2023/08/10.
//

import SwiftUI

struct TestView: View {
  @State var testState  : Bool = false
  @State var isAnimate : Bool = false
  
  var body: some View {
    ZStack{
      Rectangle()
        .fill(.black)
        .frame(height: 350)
      VStack{
        HStack(spacing: 60){
          Circle()
            .fill(.white)
            .frame(width: 80, height: 80)
            .offset(x: isAnimate ? -10: 0, y:isAnimate ? -20: 0)
            .scaleEffect(isAnimate ? 1 : 0.5)
            .animation(.easeOut(duration: 1), value: isAnimate)
          
          Circle()
            .fill(.white)
            .frame(width: 70, height: 70)
            .offset(y: -15)
            .offset(x: isAnimate ? -10: 0, y:isAnimate ? -15: 0)
            .scaleEffect(isAnimate ? 1 : 0.5)
            .animation(.easeOut(duration: 1), value: isAnimate)
          // x 0 , y 50
          
          Circle()
            .fill(.white)
            .frame(width: 55, height: 55)
            .offset(x:20 , y: 10)
            .animation(.easeOut(duration: 1), value: isAnimate)
          
        }.onTapGesture {
          isAnimate = true
                  }
        
        HStack{
          Circle()
            .fill(.white)
            .frame(width: 40, height: 40)
            .offset(y: 30)
          Text("Meet Next Developers")
            .foregroundColor(.white)
            .font(.system(size: 30))
          Spacer()
          
        }
        
        HStack(spacing: 60){
          Circle()
            .fill(.white)
            .frame(width: 60, height: 60)
            .offset(y: 40)
          Circle()
            .fill(.white)
            .frame(width: 70, height: 70)
            .offset(x:10)
          Circle()
            .fill(.white)
            .frame(width: 75, height: 75)
            .offset(x:20 , y: 25)
        }
        
      }
    }
    .frame(maxWidth: .infinity)
  }
}

struct TestView_Previews: PreviewProvider {
  static var previews: some View {
    TestView()
  }
}
