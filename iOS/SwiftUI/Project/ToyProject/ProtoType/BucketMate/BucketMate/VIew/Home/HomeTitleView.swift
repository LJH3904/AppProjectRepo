//
//  HomeTitleView.swift
//  BucketMate
//
//  Created by 마경미 on 27.07.23.
//

import Foundation
import SwiftUI

struct HomeTitle: View {
    let title: String

    var body: some View {
        HStack {
            VStack {
                Text(title)
                    .font(Font.custom("Baloo", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                Spacer()
            }.frame(height: 56)
            Spacer()
        }.padding(.horizontal, 25)
    }
}
