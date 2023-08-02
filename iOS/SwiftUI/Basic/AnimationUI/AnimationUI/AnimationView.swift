//
//  ContentView.swift
//  AnimationUI
//
//  Created by Jongwook Park on 2023/07/26.
//

import SwiftUI

struct AnimationView: View {
    
    @State private var isSpinning: Bool = true
    
    var body: some View {
        VStack {
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color.blue)
                    .frame(width: 360, height: 360)
                   
                Image(systemName: "forward.fill")
                   .font(.largeTitle)
                   .offset(y: -180)
                   .rotationEffect(.degrees(isSpinning ? 0 : 360))
                   .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false), value: isSpinning)
            }
        }
        .padding()
        .onAppear() {
           isSpinning.toggle()
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
