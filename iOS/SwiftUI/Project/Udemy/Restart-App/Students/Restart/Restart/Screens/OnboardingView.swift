//
//  OnboardingView.swift
//  Restart
//
//  Created by LJh on 2023/08/08.
//

import SwiftUI

struct OnboardingView: View {
  //MARK: - PROPERTY

  @AppStorage("onboarding") var isOnboardingViewActive : Bool = true
  
  @State private var buttonWidth : Double = UIScreen.main.bounds.width - 80
  @State private var buttonOffset : CGFloat = 0
  @State private var isAnimating : Bool = false
  @State private var imageOffset : CGSize = CGSize(width: 0, height: 0)
  @State private var indicatorOpacity : Double = 1.0
  @State private var textTitle : String = "Share."

  let hapticFeedback = UINotificationFeedbackGenerator()
  
  
  //MARK: - BODY

    var body: some View {
      ZStack {
        
        Color("ColorBlue")
          .ignoresSafeArea(.all,edges: .all)
        VStack{
          //MARK: - Header
          Spacer()
          VStack(spacing: 0) {
            Text(textTitle)
              .font(.system(size: 60))
              .fontWeight(.heavy)
              .foregroundColor(.white)
              .transition(.opacity)
              .id(textTitle)
            
            Text("""
            얼마나 많이 베푸느냐가 아니라 얼마나
            많은 사랑을 베푸느냐가 중요합니다.
            """)
            .font(.title3)
            .fontWeight(.light)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal,10)
          }// :header
          .opacity(isAnimating ? 1 : 0)
          .offset(y: isAnimating ? 0 : -40)
          .animation(.easeOut(duration: 1), value: isAnimating)
          
          //MARK: - center
          ZStack{
            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
              .offset(x:imageOffset.width * -1)
              .blur(radius: abs(imageOffset.width /  5))
              .animation(.easeOut(duration: 1), value: imageOffset)
            Image("character-1")
            .resizable()
  //                .aspectRatio(CGSize(width:3 , height: 4), contentMode: .fit)
          //aspectRatio는 비율을 자기가 조정가능하고
          
            .scaledToFill()
          //scaledToFill은 자기가
            
            //투명도
            .opacity(isAnimating ? 1 : 0)
            //애니메이션
            .animation(.easeOut(duration: 0.5), value: isAnimating)
            //위치
            .offset(x:imageOffset.width * 1.2, y: 0)
            
            .rotationEffect(.degrees(Double(imageOffset.width/10)))
            //회전률
            .gesture(DragGesture().onChanged({ a in
              if abs(imageOffset.width) <= 150 {
                imageOffset = a.translation
                
                withAnimation(.linear(duration: 0.25)){
                  indicatorOpacity = 0
                  textTitle = "Give."
                }
              }
            })
              .onEnded({ _ in
                imageOffset = .zero
                withAnimation(.linear(duration: 0.25)){
                  indicatorOpacity = 1
                  textTitle = "shrae."
                }
              }))// :gesture
            .animation(.easeOut(duration: 1), value: imageOffset)
          }// :center
          .overlay(
            Image(systemName: "arrow.left.and.right.circle")
              .font(.system(size: 44,weight: .ultraLight))
              .foregroundColor(.white)
              .opacity(isAnimating ? 1 : 0)
              .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
              .opacity(indicatorOpacity)
            ,alignment: .bottom
            
          )
          Spacer()
          //MARK: - footer
          ZStack{
            //part of the custom button
            
            // 1. background (static)
            Capsule()
              .fill(Color.white.opacity(0.2))
            
            Capsule()
              .fill(Color.white.opacity(0.2))
              .padding(8)
            
            
            
            // 2. call-to-action (static
            
            Text("시작할래 ? ")
              .font(.system(.title3,design: .rounded))
              .fontWeight(.bold)
              .foregroundColor(.white)
              .offset(x:20)
            //offset이란 아규먼트라벨 종류와 아규먼트값에 따라서 거리를 벌린다.
            
            // 3. 캡슐 (동적 넓이)
            HStack{
              Capsule()
                .fill(Color("ColorRed"))
                .frame(width: buttonOffset + 80)
              Spacer()
              
            }
            // 4. 버튼 이쁘게 만드는거 : 원 (제스처)
            HStack {
              ZStack{
                Circle()
                  .fill(Color("ColorRed"))
                
                Circle()
                  .fill(.black.opacity(0.15))
                  .padding(8)
                  //opacity는 투명도임
                Image(systemName: "chevron.right.2")
                  .font(.system(size: 24, weight: .bold))
                
              }
              .foregroundColor(.white)
              .frame(width: 80,height: 80,alignment: .center)
              .offset(x: buttonOffset)
              
              .gesture(
                DragGesture()
                  .onChanged({ gesture in
                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                      buttonOffset = gesture.translation.width
                    }
                  })
                  .onEnded{ _ in
                    withAnimation(Animation.easeOut(duration: 0.4)){
                      if buttonOffset > buttonWidth / 2 {
                        hapticFeedback.notificationOccurred(.success)
                        playSound(sound: "chimeup", type: "mp3")
                        buttonOffset = buttonWidth - 80
                        
                        isOnboardingViewActive = false
                      }else{
                        hapticFeedback.notificationOccurred(.warning)
                        buttonOffset = 0
                      }
                    }
                  }
              )// :gesture
              
              Spacer()
            }// :HStack
          }// :footer
          .frame(width : buttonWidth,height: 80,alignment: .center)
          .padding()
          .opacity(isAnimating ? 1 : 0)
          .offset(y : isAnimating ? 0 : 40)
          .animation(.easeOut(duration: 1), value: isAnimating)
        }// :VStack
      } // :ZStack
      .preferredColorScheme(.dark)
      .onAppear(){
        isAnimating = true
      }
      
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
