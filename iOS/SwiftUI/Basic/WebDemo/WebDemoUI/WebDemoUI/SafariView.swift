//
//  SafariView.swift
//  WebDemoUI
//
//  Created by Jongwook Park on 2023/08/03.
//

import SwiftUI

struct SafariView: View {
    @State private var isShowingSheet: Bool = false
    var body: some View {
        VStack {
            Button {
                isShowingSheet.toggle()
            } label: {
                Text("Show Safari View")
                    .font(.largeTitle)
                    .padding()
            }
        }
        .sheet(isPresented: $isShowingSheet) {
            MySafariView(urlString: "https://techit.education")
        }
    }
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView()
    }
}
