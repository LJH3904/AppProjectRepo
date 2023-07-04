//
//  iPadInfoView.swift
//  AppleProducts
//
//  Created by 전민석 on 2023/07/04.
//

import SwiftUI

struct IPadInfoView: View {
    var ipad: iPad
    
    var body: some View {
        NavigationStack {
             VStack {
                 AsyncImage(url: URL(string: ipad.image)) { image in
                     image
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                 } placeholder: {
                     ProgressView()
                 }
                 
                 HStack {
                     Text("출시연도 : \(ipad.year)")
                     Text("가격 : \(ipad.price)원")
                         .padding()
                 }
                 
                 HStack {
                     Text("카메라 : \(ipad.cameraPixel)MP")
                     Text("OS 버전 : iPadOS \(String(format: "%.1f",ipad.osVersion))")
                         .padding()
                 }
             }
             .padding()
             .navigationTitle("\(ipad.name)")
         }
        .padding()
    }
}

struct IPadInfoView_Previews: PreviewProvider {
    static var previews: some View {
        IPadInfoView(ipad: iPadArray[0])
    }
}
