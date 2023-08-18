//
//  PlaceGridView.swift
//  BucketMate
//
//  Created by 마경미 on 27.07.23.
//

import Foundation
import SwiftUI

struct PlaceGridView: View{
  let layout = [
    GridItem(.adaptive(minimum: 60))
  ]
  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: layout) {
        ForEach(places) { place in
          Button(action: {
            
          }, label: {
            VStack {
              AsyncImage(url: URL(string: place.imageUrl), content: { image in
                image
                  .resizable()
              }, placeholder: {
                ProgressView()
              }).frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(
                  place.isSelected ?
                  RoundedRectangle(cornerRadius: 60)
                    .inset(by: 1)
                    .stroke(Color(red: 0.47, green: 0.84, blue: 1), lineWidth: 2) : nil
                )
              Text(" \(place.placeTitle)")
                .font(Font.custom("Roboto", size: 13))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
            }
          }).padding(.horizontal, 12)
        }
        
      }
      .padding(.horizontal, 13)
      .frame(height: 117)
    }
  }
}
