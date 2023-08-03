//
//  WebSheet.swift
//  Lab13
//
//  Created by LJh on 2023/08/03.
//
import SafariServices
import SwiftUI

//struct WebSheet: UIViewRepresentable {
//
//  var webUrl : String
//  func makeUIView(context: Context) -> some UIView {
//          let webView: WKWebView = WKWebView()
//
//          if let url = URL(string: webUrl) {
//              webView.load(URLRequest(url: url))
//          }
//
//          return webView
//  }
//
//  func updateUIView(_ uiView: UIViewType, context: Context) {
//
//  }
//}

struct WebSheet: UIViewControllerRepresentable {
    var urlString: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let safariViewController = SFSafariViewController(url: URL(string: urlString)!)
        
        return safariViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}



struct WebSheet_Previews: PreviewProvider {
    static var previews: some View {
      WebSheet(urlString: "https://www.naver.com/")
    }
}
