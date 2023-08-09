//
//  ContentView.swift
//  Restart
//
//  Created by LJh on 2023/08/07.
//

import SwiftUI

struct ContentView: View {
  @AppStorage("onboarding") var isOnboardingViewActive : Bool = true
  
    var body: some View {
        ZStack {
          if isOnboardingViewActive {
            OnboardingView()
          }else{
            HomeView()
          }
        }// : ZStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
