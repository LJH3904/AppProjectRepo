//
//  ChartViewController.swift
//  WebDemoUI
//
//  Created by Jongwook Park on 2023/08/03.
//

import SwiftUI
import WebKit

struct GraphData {
    var name: String
    var value: Int
    var color: UIColor
    var flag: String
}

class ChartViewController: UIViewController {
    
    let graphDataArray: [GraphData] = [
        GraphData(name: "한국", value: 100, color: .blue, flag: "🇰🇷"),
        GraphData(name: "일본", value: 70, color: .brown, flag: "🇯🇵"),
        GraphData(name: "미국", value: 150, color: .cyan, flag: "🇺🇸"),
        GraphData(name: "중국", value: 90, color: .green, flag: "🇨🇳"),
        GraphData(name: "영국", value: 120, color: .magenta, flag: "🇬🇧"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        buildChart()
    }
    
    func buildLabel() {
        let safeArea = view.safeAreaLayoutGuide
        
        let label: UILabel = UILabel()
        label.text = "Hello World"
        label.textAlignment = .center
        view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false

        label.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
    }
    
    func buildWebView() {
        let safeArea = view.safeAreaLayoutGuide
        
        let webView: WKWebView = WKWebView()
        view.addSubview(webView)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        webView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        webView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
        webView.widthAnchor.constraint(equalTo: safeArea.widthAnchor).isActive = true
        webView.heightAnchor.constraint(equalTo: safeArea.heightAnchor).isActive = true
        
        if let url = URL(string: "https://techit.education") {
            webView.load(URLRequest(url: url))
        }
    }
    
    func buildChart() {
        let screenWidth: CGFloat = self.view.frame.size.width
        let hGraphWidth: CGFloat = CGFloat(graphDataArray.count * 60 - 10)
        let hGraphX: CGFloat = (screenWidth - hGraphWidth) / 2
        
        let hGraphView = UIView()
        // 배경색을 임시로 두어서 해당 View의 영역을 확인할 수 있다
        hGraphView.backgroundColor = .lightGray
 
        // 또는 테두리를 임시로 만들어서 영역 확인도 가능하다
//        hGraphView.layer.borderColor = CGColor(srgbRed: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
//        hGraphView.layer.borderWidth = 1.0
        
        hGraphView.clipsToBounds = true
        hGraphView.frame.origin = CGPoint(x: hGraphX, y: 0)
        hGraphView.frame.size = CGSize(width: hGraphWidth, height: 300)
        self.view.addSubview(hGraphView)
        
        let hGraphViewWidth = hGraphView.frame.size.width
        
        let hTitleLabel = UILabel()
        hTitleLabel.text = "높이 막대 그래프"
        hTitleLabel.textAlignment = .center
        hTitleLabel.frame.origin = CGPoint(x: 5, y: 5)
        hTitleLabel.frame.size = CGSize(width: hGraphViewWidth - 5 * 2, height: 30)
        hGraphView.addSubview(hTitleLabel)
        
        var index: Int = 0
        
        for graphData in graphDataArray {
            
            let name: String = graphData.name
            let value: Int = graphData.value
            let color: UIColor = graphData.color
            let flag: String = graphData.flag
            
            let nameLabel = UILabel()
            nameLabel.text = name
            nameLabel.textAlignment = .center
//            nameLabel.backgroundColor = .cyan
            nameLabel.frame.origin = CGPoint(x: 0 + index * 60, y: 250)
            nameLabel.frame.size = CGSize(width: 50, height: 50)
            hGraphView.addSubview(nameLabel)
            
            let valueView = UIView()
            valueView.backgroundColor = color
            valueView.frame.origin = CGPoint(x: 0 + index * 60, y: 250 - value)
            valueView.frame.size = CGSize(width: 50, height: value)
            hGraphView.addSubview(valueView)
            
            let flagView = UILabel()
            flagView.text = flag
            flagView.font = UIFont(name: "Helvetica", size: 40)
            flagView.textAlignment = .center
//            flagView.backgroundColor = .cyan
            flagView.frame.origin = CGPoint(x: 0 + index * 60, y: 250 - value - 50)
            flagView.frame.size = CGSize(width: 50, height: 50)
            hGraphView.addSubview(flagView)
            
            index += 1
        }
        
        let wGraphView = UIView()
        wGraphView.backgroundColor = .lightGray
        wGraphView.frame.origin = CGPoint(x: 10, y: 0)
        wGraphView.frame.size = CGSize(width: screenWidth - 10 * 2, height: 350)
        self.view.addSubview(wGraphView)
        
        let wGraphViewWidth = wGraphView.frame.size.width
        
        let wTitleLabel = UILabel()
        wTitleLabel.text = "넓이 막대 그래프"
        wTitleLabel.textAlignment = .center
        wTitleLabel.frame.origin = CGPoint(x: 5, y: 5)
        wTitleLabel.frame.size = CGSize(width: wGraphViewWidth - 5 * 2, height: 30)
        wGraphView.addSubview(wTitleLabel)
        
        index = 0
        
        for graphData in graphDataArray {
            
            // 이 변수/상수의 scope는 for-in 문의 안쪽으로 한정된다
            let name: String = graphData.name
            let value: Int = graphData.value
            let color: UIColor = graphData.color
            let flag: String = graphData.flag
            
            
            let nameLabel = UILabel()
            nameLabel.text = name
            nameLabel.textAlignment = .center
//            nameLabel.backgroundColor = .cyan
            nameLabel.frame.origin = CGPoint(x: 0, y: 50  + index * 60)
            nameLabel.frame.size = CGSize(width: 50, height: 50)
            wGraphView.addSubview(nameLabel)
            
            let valueView = UIView()
            valueView.backgroundColor = color
            valueView.frame.origin = CGPoint(x: 50, y: 50  + index * 60)
            valueView.frame.size = CGSize(width: value, height: 50)
            wGraphView.addSubview(valueView)
            
            let flagView = UILabel()
            flagView.text = flag
            flagView.font = UIFont(name: "Helvetica", size: 40)
            flagView.textAlignment = .center
//            flagView.backgroundColor = .cyan
            flagView.frame.origin = CGPoint(x: 50 + value, y: 50  + index * 60)
            flagView.frame.size = CGSize(width: 50, height: 50)
            wGraphView.addSubview(flagView)
            
            index += 1
        }
        
        let firstView = wGraphView
        let secontView = hGraphView
 
        firstView.frame.origin.y = 100
        
        let firstY = firstView.frame.origin.y
        let firstHeight = firstView.frame.size.height
        
        secontView.frame.origin.y = firstY + firstHeight + 20
    }
}
