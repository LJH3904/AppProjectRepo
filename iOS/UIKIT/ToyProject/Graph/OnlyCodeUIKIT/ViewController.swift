//
//  ViewController.swift
//  OnlyCodeUIKIT
//
//  Created by LJh on 2023/07/14.
//

import UIKit

class ViewController: UIViewController {
  let heights : [Int] = [150,200,300,200,100]
  let widths : [Int] = [75,300,200,250,100]
  let colors : [UIColor] = [UIColor.black,UIColor.red,UIColor.blue,UIColor.green,UIColor.lightGray]
  let graph1X : Int = 10
  let graph1Y : Int = 400
  let graph2X : Int = 10
  let graph2Y : Int = 700
  var index = 0
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let labelView = UILabel()
    labelView.textColor = colors[0]
    labelView.text = "Hello World"
    labelView.frame.origin.x = 30
    labelView.frame.origin.y = 50
    labelView.frame.size.width = 150
    labelView.frame.size.height = 50
    self.view.addSubview(labelView)
    
    
    for height in heights{
     
      let boxView = UIView(frame: CGRect(x:graph1X + index * 75 , y: graph1Y - height, width: 30, height: height))
      boxView.backgroundColor = colors[index]
      self.view.addSubview(boxView)

      let label = UILabel(frame: CGRect(x: graph1X + index * 75 , y: graph1Y , width: 50 , height: 50 ))
      label.text = "\(index)"
      self.view.addSubview(labelView)
      self.view.addSubview(label)

      index += 1
    }
    
    index = 0
    
    for width in widths{
      
      let graph2 = UIView(frame: CGRect(x: graph2X , y: graph2Y - index * 50 , width: width , height: 30))
      graph2.backgroundColor = colors[index]
      let label2 = UILabel(frame: CGRect(x: graph2X, y: graph2Y - (index * 50) + 10 , width: 30, height: 30))
      
      label2.text = "\(index)"
      self.view.addSubview(graph2)
      self.view.addSubview(label2)
      
      index += 1
    }
    
  }
 

}

