//
//  ViewController.swift
//  RandomNumber
//
//  Created by 신희권 on 2023/06/19.
//

import UIKit

class ViewController: UIViewController {
    // 각 인덱스 값 추출
    // 랜덤 값 생성
    
    @IBOutlet var seg1: UISegmentedControl!
    @IBOutlet var seg2: UISegmentedControl!
    @IBOutlet var seg3: UISegmentedControl!
    @IBOutlet var seg4: UISegmentedControl!
    @IBOutlet var seg5: UISegmentedControl!
    var pickerSelectNum : [Int] = [0,0,0,0,0]
    var randomIntArray : [Int] = [
            Int.random(in: 0...9),
            Int.random(in: 0...9),
            Int.random(in: 0...9),
            Int.random(in: 0...9),
            Int.random(in: 0...9)
        ]
    
    var answerCount = 0
    
    @IBOutlet var answerCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in (0...10).reversed(){
            seg1.setTitle("\(i)", forSegmentAt: i)
            seg2.setTitle("\(i)", forSegmentAt: i)
            seg3.setTitle("\(i)", forSegmentAt: i)
            seg4.setTitle("\(i)", forSegmentAt: i)
            seg5.setTitle("\(i)", forSegmentAt: i)
        }
      
    }
    @IBAction func newStartBtn(_ sender: Any) {
        randomIntArray = [
                Int.random(in: 0...9),
                Int.random(in: 0...9),
                Int.random(in: 0...9),
                Int.random(in: 0...9),
                Int.random(in: 0...9)
            ]
        pickerSelectNum = [0,0,0,0,0]
        answerCount = 0
        segInit(seg: seg1)
        segInit(seg: seg2)
        segInit(seg: seg3)
        segInit(seg: seg4)
        segInit(seg: seg5)
        answerCountLabel.text = ""
        //아몰랑,,
    }
    

    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        pickerSelectNum[0] = sender.selectedSegmentIndex
        getAnswer(index: 0)
     
        allClear()
        
    }
    
    @IBAction func segmentedControlValueChanged2(_ sender: UISegmentedControl) {
        pickerSelectNum[1] = sender.selectedSegmentIndex
        getAnswer(index: 1)
        allClear()
    }
    
    @IBAction func segmentedControlValueChanged3(_ sender: UISegmentedControl) {
        pickerSelectNum[2] = sender.selectedSegmentIndex
        getAnswer(index: 2)
        allClear()
    }
    
    @IBAction func segmentedControlValueChanged4(_ sender: UISegmentedControl) {
        pickerSelectNum[3] = sender.selectedSegmentIndex
        getAnswer(index: 3)
        allClear()
    }
    
    
    @IBAction func segmentedControlValueChanged5(_ sender: UISegmentedControl) {
        pickerSelectNum[4] = sender.selectedSegmentIndex
        getAnswer(index: 4)
        allClear()
    }
    
    
    
}
    
extension ViewController {
    func getAnswer(index: Int) {
        if pickerSelectNum[index] == randomIntArray[index] {
            answerCount += 1
            answerCountLabel.text = "\(answerCount)"
        }
    }
    
    func segInit(seg: UISegmentedControl) {
        seg.selectedSegmentIndex = 0
    }
    
    func allClear() {
        
        if answerCount >= 5 {
            answerCountLabel.text = "다 정답"
        }
    }
}
