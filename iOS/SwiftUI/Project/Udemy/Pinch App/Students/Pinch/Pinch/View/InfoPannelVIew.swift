//
//  InfoPannelVIew.swift
//  Pinch
//
//  Created by LJh on 2023/08/11.
//

import SwiftUI

struct InfoPannelVIew: View {
    var scale : CGFloat
    var offset : CGSize

  @State private var isInfoPanelVisible : Bool = false
  
    var body: some View {
      HStack{
        //MARK: - HotSpot
        Image(systemName: "circle.circle")
          .symbolRenderingMode(.hierarchical)
          .resizable()
          .frame(width: 30,height: 30)
          .onLongPressGesture(minimumDuration: 1) {
            withAnimation(.easeOut){
              isInfoPanelVisible.toggle()
            }
          }
        Spacer()
        //MARK: - Info Panel
        HStack(spacing: 2) {
          Image(systemName: "arrow.up.left.and.arrow.down.right")
          Text("\(scale)")
          Spacer()
          
          Image(systemName: "arrow.left.and.right")
          Text("\(offset.width)")
          Spacer()
          
          Image(systemName: "arrow.up.and.down")
          Text("\(offset.height)")
          Spacer()
        }
        .font(.footnote)
        .padding(8)
        .background(.ultraThinMaterial)
        .cornerRadius(8)
        .frame(width: 320)
        .opacity(isInfoPanelVisible ? 1 : 0 )
        Spacer()
      }

    }
}

struct InfoPannelVIew_Previews: PreviewProvider {
    static var previews: some View {
      InfoPannelVIew(scale: 1, offset: .zero)
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
