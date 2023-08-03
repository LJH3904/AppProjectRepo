//
//  MySafariView.swift
//  WebDemoUI
//
//  Created by Jongwook Park on 2023/08/03.
//

import SwiftUI
import SafariServices

struct MySafariView: UIViewControllerRepresentable {
    var urlString: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let safariViewController = SFSafariViewController(url: URL(string: urlString)!)
        
        return safariViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct MySafariView_Previews: PreviewProvider {
    static var previews: some View {
        MySafariView(urlString: "https://techit.education")
    }
}
