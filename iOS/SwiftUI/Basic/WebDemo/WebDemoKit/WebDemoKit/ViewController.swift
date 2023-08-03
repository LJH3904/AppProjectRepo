//
//  ViewController.swift
//  WebDemoKit
//
//  Created by Jongwook Park on 2023/08/03.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        buildInterface()
    }
    
    func buildInterface() {
        let safeArea = view.safeAreaLayoutGuide
        
        let label: UILabel = UILabel()
        label.text = "Hello World"
        label.textAlignment = .center
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
    }
}

