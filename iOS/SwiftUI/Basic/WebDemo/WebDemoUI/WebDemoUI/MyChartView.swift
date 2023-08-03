//
//  MyChartView.swift
//  WebDemoUI
//
//  Created by Jongwook Park on 2023/08/03.
//

import SwiftUI

struct MyChartView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        return ChartViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct MyChartView_Previews: PreviewProvider {
    static var previews: some View {
        MyChartView()
    }
}
