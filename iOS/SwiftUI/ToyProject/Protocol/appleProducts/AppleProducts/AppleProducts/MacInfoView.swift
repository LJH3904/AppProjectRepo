//
//  macInfoView.swift
//  AppleProducts
//
//  Created by 전민석 on 2023/07/04.
//

import SwiftUI

struct MacInfoView: View {
    var mac: Mac
    
    var body: some View {
        NavigationStack {
             VStack {
                 AsyncImage(url: URL(string: mac.image)) { image in
                     image
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                 } placeholder: {
                     ProgressView()
                 }
                 
                 HStack {
                     Text("출시연도 : \(mac.year)")
                     Text("가격 : \(mac.price)원")
                         .padding()
                 }
                 
                 HStack {
                     Text("카메라 : \(mac.cameraPixel)P")
                     Text("OS 버전 : macOS \(String(format: "%.1f",mac.osVersion))")
                         .padding()
                 }
             }
             .padding()
             .navigationTitle("\(mac.name)")
         }
        .padding()
    }
}

struct MacInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MacInfoView(mac: macArray[0])
    }
}
