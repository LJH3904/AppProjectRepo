//
//  appleWatchInfoView.swift
//  AppleProducts
//
//  Created by 전민석 on 2023/07/04.
//

import SwiftUI

struct AppleWatchInfoView: View {
    var appleWatch: AppleWatch
    
    var body: some View {
        NavigationStack {
             VStack {
                 AsyncImage(url: URL(string: appleWatch.image)) { image in
                     image
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                 } placeholder: {
                     ProgressView()
                 }
                 
                 HStack {
                     Text("출시연도 : \(appleWatch.year)")
                     Text("가격 : \(appleWatch.price)원")
                         .padding()
                 }
                 
                 HStack {
                     Text("OS 버전 : WatchOS \(String(format: "%.1f",appleWatch.osVersion))")
                         .padding()
                 }
             }
             .padding()
             .navigationTitle("\(appleWatch.name)")
         }
        .padding()
    }
}

struct AppleWatchInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AppleWatchInfoView(appleWatch: appleWatchArray[0])
    }
}
