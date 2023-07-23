//
//  CardView.swift
//  HikeApp
//
//  Created by LJh on 2023/07/24.
//

import SwiftUI

struct CardView: View {
    var body: some View {
      //MARK: - Card

      ZStack {
        CustomBackgroundView()
        VStack {
          
          //MARK: - Header
          
          VStack(alignment: .leading) {
            HStack {
              Text("Hiking")
                .fontWeight(.black)
                .font(.system(size: 52))
                .foregroundStyle(LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom)
                )
              
              Spacer()
              
              Button {
                //action : show a sheet
                print("The button was pressed")
              } label: {
                CustomButtonView()              }

            }
            
            Text("Fun and enjoyable outdoor activity for freiends and families.")
              .multilineTextAlignment(.leading)
              .italic()
              .foregroundColor(.customGrayMedium)
          }// :header
          
          .padding(.horizontal,30)
          
          //MARK: - main COntent
          
          


          ZStack {
            Circle()
              .fill(
                LinearGradient(colors: [
                  Color("ColorIndigoMedium"),
                  Color("ColorSalmonLight")],
                  startPoint: .topLeading, endPoint: .bottomLeading))
              .frame(width: 256,height: 256)
            Image("image-1")
            
            .resizable()
            .scaledToFit()
          }
          
          //MARK: - Footer

        }// : Vstack
      }//card
      .frame(width: 320,height: 570)
      
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
