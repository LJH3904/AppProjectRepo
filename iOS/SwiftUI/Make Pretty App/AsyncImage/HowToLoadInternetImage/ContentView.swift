//
//  ContentView.swift
//  HowToLoadInternetImage
//
//  Created by LJh on 2023/07/20.
//

import SwiftUI


//확장은 이런식으로도 사용하는구나 !
extension Image{
  func imageModifiier() -> some View {
    self
      .resizable()
      .scaledToFit()
  }
  
  func iconModifier () -> some View{
    self
      .imageModifiier()
      .frame(maxWidth: 128)
      .foregroundColor(.purple)
      .opacity(0.5)
  }
}


struct ContentView: View {
  private let imageURL : String = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
        VStack {
          //MARK: 1 - Basic
//          AsyncImage(url: URL(string: imageURL))

          //MARK: 2 - Scale
          // AsyncImage(url: URL(string: imageURL),scale: 3.0)
          //크기를 나타낸다. This code shows the image's scale
          //
          
          //MARK: 3 - PlaceHolder
//          AsyncImage(url: URL(string: imageURL)){ image in
//            image.imageModifiier()
//          }placeholder: {
//            Image(systemName: "photo.circle.fill").iconModifier()
//
//          }
//          .padding(40)
//          //MARK: - 4. PHASE
//          AsyncImage(url: URL(string: imageURL)){ phase in
//            if let image = phase.image {
//              image.imageModifiier()
//            }else if phase.error != nil{
//              Image(systemName: "ant.circle.fill").iconModifier()
//            }else{
//              Image(systemName: "photo.circle.fill").iconModifier()
//            }
//          }
//          .padding(40)
//          //if 에러처리 하기
          //MARK: - 5 animation

          AsyncImage(url: URL(string: imageURL),transaction: Transaction(animation: .spring(response: 0.5,dampingFraction: 0.6,blendDuration: 0.25))){ image in
            switch image{
              case .success(let image):
                image.imageModifiier()
                //                  .transition(.move(edge: .bottom))
                //                  .transition(.slide)
                  .transition(.scale)
              case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
              case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
              @unknown default:
                ProgressView()
            }
          }
          .padding(40)
//
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
