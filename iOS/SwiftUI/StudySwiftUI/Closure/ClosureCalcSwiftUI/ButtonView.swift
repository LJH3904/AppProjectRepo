//
//  ButtonView.swift
//  ClosureCalcSwiftUI
//
//  Created by Handoo Jeong on 2023/06/29.
//

import Foundation
import SwiftUI


struct ButtonView: View {
    var buttonString:String
    var buttonBG_Color:Color
    var leadTrailling:CGFloat = 75
    
    var body: some View {
        HStack(alignment: .center) {
            
            Text("\(buttonString)")
            
            
        }
        .bold()
        .padding(buttonString == "0" ? EdgeInsets(top: 25, leading: leadTrailling, bottom: 25, trailing: leadTrailling) : EdgeInsets(top: 25, leading: 35, bottom: 25, trailing: 35))

   
        
//        .padding([.top, .bottom], 25)
        .font(.largeTitle)
        
        .foregroundColor(Color.white)
        .background(buttonBG_Color)
        .cornerRadius(50)
        
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonString: "0", buttonBG_Color: .blue)
    }
}
