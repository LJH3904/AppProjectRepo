//
//  ContentView.swift
//  Stickers
//
//  Created by Jongwook Park on 2023/08/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            StickerListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
