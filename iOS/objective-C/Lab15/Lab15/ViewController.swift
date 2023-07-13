//
//  ViewController.swift
//  Lab15
//
//  Created by LJh on 2023/07/13.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let calc : Cal = Cal()
    print(calc.plus(2, with: 2))
    print(calc.minus(2, with: 2))
    print(calc.multiply(2, with: 2))
    print(calc.divide(2, with: 2))

    
  }


}

