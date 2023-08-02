//
//  TransitionView.swift
//  AnimationUI
//
//  Created by Jongwook Park on 2023/07/26.
//

import SwiftUI

struct TransitionView: View {

    @State private var isButtonVisible: Bool = true
    
    var body: some View {
        VStack {
            Toggle(isOn:$isButtonVisible.animation(.linear(duration: 1))) {
                Text("Show/Hide Button")
            }
            .padding()
            
            if isButtonVisible {
               Button(action: {}) {
                   Text("Example Button")
               }
               .font(.largeTitle)
//               .transition(.slide)
//               .transition(.scale)
//               .transition(.move(edge: .top))
//               .transition(.fadeAndMove)
               .transition(.asymmetric(insertion: .scale, removal: .slide))
           }
        }
        .padding()
    }
}

extension AnyTransition {
    static var fadeAndMove: AnyTransition {
        .opacity.combined(with: .move(edge: .top))
    }
}

struct TransitionView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionView()
    }
}
