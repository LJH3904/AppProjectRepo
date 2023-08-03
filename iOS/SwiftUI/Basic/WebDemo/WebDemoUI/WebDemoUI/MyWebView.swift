//
//  MyWebView.swift
//  WebDemoUI
//
//  Created by Jongwook Park on 2023/08/03.
//

import SwiftUI
import WebKit

struct MyWebView: UIViewRepresentable  {
    
    func makeUIView(context: Context) -> some UIView {
        let webView: WKWebView = WKWebView()
        
        if let url = URL(string: "https://techit.education") {
            webView.load(URLRequest(url: url))
        }
        
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView()
    }
}
