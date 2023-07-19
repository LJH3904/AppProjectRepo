//
//  ThirdViewController.swift
//  Tapbar
//
//  Created by LJh on 2023/07/19.
//

import UIKit

class ThirdViewController: UIViewController {

  let celsiusTextfield : UITextField = UITextField()
  let changedToFahrenheit : UIButton = UIButton()
  let FahrenheitLabel : UILabel = UILabel()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    buildInterface()
  }
  
  func buildInterface(){
    view.backgroundColor = .white
    celsiusTextfield.placeholder = "sad"
    view.addSubview(celsiusTextfield)
    
    celsiusTextfield.translatesAutoresizingMaskIntoConstraints = false
    // 이유는 viewController의 view와 해당 subview의 기본 관계가 성립되어야 레이아웃의 상대성이 생기기 때문이다
    NSLayoutConstraint.activate([
      // countLabel의 중심 X축을 viewController의 view가 가지는 중심 X축과 동일하게 만든다
      celsiusTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      // countLabel의 중심 Y축을 viewController의 view가 가지는 중심 Y축과 동일하게 만든다
      celsiusTextfield.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ])
    
    changedToFahrenheit.setTitle("변경", for: .normal)
    changedToFahrenheit.setTitleColor(.blue, for: .normal)
    changedToFahrenheit.addTarget(self, action: #selector(change), for: .touchUpInside)
    
    
    view.addSubview(changedToFahrenheit)
    
    changedToFahrenheit.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      changedToFahrenheit.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      changedToFahrenheit.topAnchor.constraint(equalTo:celsiusTextfield.bottomAnchor, constant: 30)])
    
    FahrenheitLabel.text = "변화될 값"
    view.addSubview(FahrenheitLabel)
    FahrenheitLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      FahrenheitLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      FahrenheitLabel.topAnchor.constraint(equalTo: changedToFahrenheit.bottomAnchor, constant: 30)
    ])
    
  }
  @objc func change(){
    //텍스트필드의 값이 스트링이니
    //화씨 = (섭씨 × 9/5) + 32
    //celsiusTextfield = 섭씨
    //FahrenheitLabel = 화씨
    
//    var test = Int(celsiusTextfield.text) * 9/5 + 32
    var test: Int
    if let c = celsiusTextfield.text {
      test = Int(c) ?? 0
      
      FahrenheitLabel.text = "\((test * 9/5) + 32 )"
    }

  }
   

}
