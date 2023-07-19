//
//  ViewController.swift
//  0719UIKIT
//
//  Created by LJh on 2023/07/19.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var inputLabel: UITextField!
  
  @IBOutlet weak var inputTextField: UILabel!
  var test : Int = 0
  
  override func viewDidLoad() {

    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func aaaa(_ sender: UIButton) {
    test = Int(inputLabel.text ?? "" ) ?? 0
    inputTextField.text = "\((test * 9/5) + 32)"
    
    //화씨 = (섭씨 × 9/5) + 32
    
  }
  
}

