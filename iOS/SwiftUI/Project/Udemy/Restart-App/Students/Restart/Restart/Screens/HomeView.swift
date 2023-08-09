//
//  HomeView.swift
//  Restart
//
//  Created by LJh on 2023/08/08.
//

import SwiftUI

struct HomeView: View {
  @AppStorage("onboarding") var isOnboardingViewActive : Bool = false
  @State private var isAnimating : Bool = false
  //MARK: - BODY


  var body: some View {
    VStack(spacing:20){
      //MARK: - header

      
      Spacer()
      
      ZStack {
        CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
        Image("character-2")
          .resizable()
          .scaledToFit()
        .padding()
        .offset(y: isAnimating ? 35 : -35)
        .animation(Animation.easeInOut(duration: 4).repeatForever(),value: isAnimating)
        
      }
      
      //MARK: - center
      
      Text("얼마나 집중하느냐에 따라 통달까지 걸리는 시간이 달리지죠")
        .font(.title3)
        .fontWeight(.light)
        .foregroundColor(.secondary)
        .multilineTextAlignment(.center)
        .padding()
      
      //MARK: - footer
      Spacer()
      
      Button {
        withAnimation {
          playSound(sound: "success", type: "m4a")
          isOnboardingViewActive = true
        }
      } label: {
        Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
          .imageScale(.large)
        
        Text("Restart")
          .font(.system(.title3,design: .rounded))
          .fontWeight(.bold)
        
      }// :Button
      .buttonStyle(.borderedProminent)
      .buttonBorderShape(.capsule)
      .controlSize(.large)
      
    } // :VSTack
    .onAppear(){
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
        isAnimating = true
      })
    }
  }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
