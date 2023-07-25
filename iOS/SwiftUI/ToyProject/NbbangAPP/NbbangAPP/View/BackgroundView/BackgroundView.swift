//
//  BackgroundView.swift
//  NbbangAPP
//
//  Created by LJh on 2023/07/25.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
      ZStack{
        
          //MARK: - 3. DEPTH(깊이)

          
        Color.colorBrownMedium
            .cornerRadius(40)
            .offset(y:12)
          
          //MARK: - 2. LIGHT
          Color.customOrangeLight
            .cornerRadius(40)
            .offset(y:3)
            .opacity(0.85)
          //MARK: - 1. SURFACE(표면)


        LinearGradient(colors: [Color.customSalmonLight,Color.customOrangeLight],
               startPoint: .top,
               endPoint: .bottom
          )
          .cornerRadius(40)
        
      }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
