//
//  MyUILabel.swift
//  WebDemoUI
//
//  Created by Jongwook Park on 2023/08/03.
//

import SwiftUI

struct MyUILabel: UIViewRepresentable {
    
    var text: String
    
    func makeUIView(context: Context) -> some UIView {
        
        let label: UILabel = UILabel()
        label.text = text
        label.textAlignment = .center
        
        return label
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // 필요한 업데이트 작업을 수행한다
    }
}

struct MyUILabel_Previews: PreviewProvider {
    static var previews: some View {
        MyUILabel(text: "Hello World!")
    }
}
