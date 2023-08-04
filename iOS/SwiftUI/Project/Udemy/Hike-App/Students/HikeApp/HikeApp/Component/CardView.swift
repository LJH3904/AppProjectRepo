//
//  CardView.swift
//  HikeApp
//
//  Created by LJh on 2023/07/24.
//

import SwiftUI

struct CardView: View {
  
  //MARK: - 속성들
  
  @State private var imageNumber : Int = 1
  @State private var randomnumber : Int = 1
  @State private var isShowingSheet : Bool = false
  //MARK: - 함수들
  func randomImage(){
    print("----Button was pressed")
    print("status: old image number \(imageNumber)")
    repeat {
      randomnumber = Int.random(in: 1...5)
      print("Action: Random number Generated \(imageNumber)")
    }while randomnumber == imageNumber
    
    
    imageNumber = randomnumber
    print("Result: New Image Number \(imageNumber)")
    print("--- The End-----")
    print("\n")
  }
  
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
              isShowingSheet.toggle()
            } label: {
              CustomButtonView()
            }
            .sheet(isPresented: $isShowingSheet){
              SettingView()
                .presentationDragIndicator(.visible)
                .presentationDetents([.medium,.large])
            }
          }
          
          Text("Fun and enjoyable outdoor activity for freiends and families.")
            .multilineTextAlignment(.leading)
            .italic()
            .foregroundColor(.customGrayMedium)
        }// :header
        
        .padding(.horizontal,30)
        
        //MARK: - Main Content
        
        ZStack {
          CustomCircleView()
          Image("image-\(imageNumber)")
            .resizable()
            .scaledToFit()
            .animation(.default, value: imageNumber)
        }
        
        //MARK: - Footer
        Button {
          // ACTION: Generate a random number
          randomImage()
        } label: {
          Text("Explore More")
            .font(.title2)
            .fontWeight(.heavy)
            .foregroundStyle(
              LinearGradient(colors: [.customGreenLight,.customGreenMedium],
                             startPoint: .top,
                             endPoint: .bottom
                            )
            )
            .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
        }
        .buttonStyle(GradientButton())
      }// : ZSTACK
    }// : CARD
    .frame(width: 320,height: 570)
    
  }
}

struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView()
  }
}
