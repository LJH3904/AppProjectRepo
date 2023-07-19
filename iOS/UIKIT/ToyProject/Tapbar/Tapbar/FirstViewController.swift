//
//  FirstViewController.swift
//  Tapbar
//
//  Created by LJh on 2023/07/19.
//

import UIKit

class FirstViewController: UIViewController {
  var count : Int = 0
  let countLabel :UILabel = UILabel()
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    buildInterface()
  }
  
  func buildInterface(){
    view.backgroundColor = .white
    
    
    
    countLabel.backgroundColor = .systemRed
    countLabel.textColor = .black
    countLabel.font = .systemFont(ofSize: 100)
    view.addSubview(countLabel)
    
    countLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      countLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ])
    let button :UIButton = UIButton()
    button.setTitle("dd", for: .normal)
    button.backgroundColor = .systemRed
    view.addSubview(button)
    
    button.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 20)
    ])
    button.addTarget(self, action:#selector(tapped), for: .touchUpInside)
    
  }
  @objc func tapped(){
    count += 1
    countLabel.text = "\(count)"
  }
  
  
  
}
