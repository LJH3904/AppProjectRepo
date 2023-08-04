//
//  ShoppingWebView.swift
//  ShoppingList
//
//  Created by 아라 on 2023/08/04.
//

import SwiftUI
import SafariServices

struct ShoppingWebView: UIViewControllerRepresentable {
    @Binding var url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

struct ShoppingWebView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingWebView(url: .constant(URL(string: "https://www.apple.com/kr/mac-studio/")!))
    }
}
