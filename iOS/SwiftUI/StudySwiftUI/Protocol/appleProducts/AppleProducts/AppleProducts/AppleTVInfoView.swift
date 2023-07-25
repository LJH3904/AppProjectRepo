//
//  appleTVInfoView.swift
//  AppleProducts
//
//  Created by 전민석 on 2023/07/04.
//

import SwiftUI

struct AppleTVInfoView: View {
    var appleTV: AppleTV
    
    var body: some View {
        NavigationStack {
             VStack {
                 AsyncImage(url: URL(string: appleTV.image)) { image in
                     image
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                 } placeholder: {
                     ProgressView()
                 }
                 
                 HStack {
                     Text("출시연도 : \(appleTV.year)")
                     Text("가격 : \(appleTV.price)원")
                         .padding()
                 }
                 
                 HStack {
                     Text("OS 버전 : TVOS \(String(format: "%.1f",appleTV.osVersion))")
                         .padding()
                 }
             }
             .padding()
             .navigationTitle("\(appleTV.name)")
         }
        .padding()
    }
}

struct AppleTVInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AppleTVInfoView(appleTV: appleTVArray[0])
    }
}
