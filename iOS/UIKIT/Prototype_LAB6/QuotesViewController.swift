//
//  QuotesViewController.swift
//  Prototype_LAB6
//
//  Created by LJh on 2023/07/20.
//

import UIKit

class QuotesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      buildInterface()
        // Do any additional setup after loading the view.
    }
  func buildInterface(){
    view.backgroundColor = .systemBackground
    navigationItem.title = "견적신청서"
    let whab =  UIImageView(image: UIImage(named: "견적신청서"))
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
