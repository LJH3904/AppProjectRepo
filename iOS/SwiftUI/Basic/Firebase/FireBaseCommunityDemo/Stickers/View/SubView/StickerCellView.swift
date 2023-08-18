//
//  StickerCellView.swift
//  Stickers
//
//  Created by Jongwook Park on 2023/08/18.
//

import SwiftUI

struct StickerCellView: View {
    var sticker: Sticker
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(sticker.memo)
                .padding()
            HStack {
                Text(sticker.username)
                    .font(.footnote)
                    .padding()
                Spacer()
                Text(sticker.createdDate)
                    .font(.footnote)
                    .padding()
            }
        }
        .background(sticker.color)
        .shadow(radius: 3)
        .padding()
    }
}

struct StickerCellView_Previews: PreviewProvider {
    @State static var sticker = StickerStore().sampleSticker
    
    static var previews: some View {
        Group {
            StickerCellView(sticker: sticker)
                .previewDevice(PreviewDevice(rawValue: "iPhone 14 Plus"))
            
            StickerCellView(sticker: sticker)
                .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
        }
        .previewLayout(.fixed(width: 400, height: 200))
    }
}
