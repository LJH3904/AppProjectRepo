//
//  iPhoneInfoView.swift
//  AppleProducts
//
//  Created by 전민석 on 2023/07/04.
//

import SwiftUI

struct IPhoneInfoView: View {
    var iphone: iPhone
    
    var body: some View {
       NavigationStack {
            VStack {
                AsyncImage(url: URL(string: iphone.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                
                HStack {
                    Text("출시연도 : \(iphone.year)")
                    Text("가격 : \(iphone.price)원")
                        .padding()
                }
                
                HStack {
                    Text("카메라 : \(iphone.cameraPixel)MP")
                    Text("OS 버전 : iOS\(String(format: "%.1f",iphone.osVersion))")
                        .padding()
                }
            }
            .padding()
            .navigationTitle("\(iphone.name)")
        }
       .padding()
    }
}

struct IPhoneInfoView_Previews: PreviewProvider {
    static var previews: some View {
        IPhoneInfoView(iphone: iPhoneArray[0])
    }
}
