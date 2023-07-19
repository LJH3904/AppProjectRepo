//
//  fourthViewController.swift
//  Tapbar
//
//  Created by LJh on 2023/07/19.
//

import UIKit

class fourthViewController: UIViewController       {
  
  override func viewDidLoad()           {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    interface()
  }
  
  func interface(){
    let button = UIButton()
    
    button.setTitle(".", for: .normal)
    button.backgroundColor = .systemRed
    view.addSubview(button)
    
    
    button.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ]
    )
    button.addTarget(self, action: #selector(goNext), for: .touchUpInside)
  }
  
  @objc func goNext() {
    let detailViewController = TapViewController()
    navigationController?.pushViewController(detailViewController, animated: .random())
  }
  
}

