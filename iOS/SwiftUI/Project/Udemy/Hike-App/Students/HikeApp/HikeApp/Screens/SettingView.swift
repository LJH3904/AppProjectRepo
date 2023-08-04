//
//  SettingView.swift
//  HikeApp
//
//  Created by LJh on 2023/08/05.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
      List{
        //MARK: - Section : Header
        Section{
          HStack {
            Spacer()
            
            Image(systemName: "laurel.leading")
              .font(.system(size: 80,weight: .black))
            
            VStack(spacing : -10) {
              Text("Hike")
                .font(.system(size: 66,weight: .black))
              Text("Editors' Choice")
                .fontWeight(.medium)
            }
            Image(systemName: "laurel.trailing")
              .font(.system(size: 80,weight: .black))
            Spacer()
            
          }.foregroundStyle(
            LinearGradient(colors : [
              .customGreenLight,
              .customGreenMedium,
              .customGreenDark],
                           startPoint: .top,
                           endPoint: .bottom
            )
          )
          .padding(.top,8)
          VStack(spacing:8){
            Text("Where can you find \nperfect tracks?")
              .font(.title2)
              .fontWeight(.heavy)
            
            Text("Do you love the rain? Does it make you dance\nWhen you're drunk with your friends at a party?\nWhat's your favorite song, does it make you smile?\nDo you think of me?")
              .font(.footnote)
              .italic()
            
            Text("I'd spend ten thousand hours and ten thousand more\nOh, if that's what it takes to learn that sweet heart of yours")
              .fontWeight(.heavy)
              .foregroundColor(.customGreenLight)
          }
          .multilineTextAlignment(.center)
          .padding(.bottom,16)
          .frame(maxWidth: .infinity)
        }//: Header
        .listRowSeparator(.hidden)
        //MARK: - Section : Icons
        
        //MARK: - Section : About


      }// : List
    
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
