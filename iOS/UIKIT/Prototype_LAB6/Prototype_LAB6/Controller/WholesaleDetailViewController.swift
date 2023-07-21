//
//  WholesaleDetailViewController.swift
//  Prototype_LAB6
//
//  Created by LJh on 2023/07/20.
//

import UIKit

class WholesaleDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        buildInterface()
    }
    
    func buildInterface(){
        
        let whab =  UIImageView(image: UIImage(named: "WholesaleDealerDetailImage"))
        let safeArea = view.safeAreaLayoutGuide
        whab.contentMode = .scaleToFill
        view.addSubview(whab)
        
        whab.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            whab.topAnchor.constraint(equalTo: safeArea.topAnchor ),
            whab.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            whab.widthAnchor.constraint(equalToConstant: view.bounds.width),
            //      whab.heightAnchor.constraint(equalToConstant: 00)
            whab.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
        //굳 홈끝
    }
}
