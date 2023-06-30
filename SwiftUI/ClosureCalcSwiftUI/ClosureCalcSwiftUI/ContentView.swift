//
//  ContentView.swift
//  ClosureCalcSwiftUI
//
//  Created by 봉주헌 on 2023/06/29.
//

import SwiftUI

struct ContentView: View {
    
    var oprArray: [String] = ["X", "+", "-", "="]
    @State var resultText: String = ""
    
    @State var btnBG : Color = .red
    @State var isOPR: Bool = false
    
    @State var firstNumber: String = ""
    @State var secondNumber: String = ""
    
    @State var resultOprFunc: String = ""
    
    @State var checkOpr: Int = 0
    
    @State var oprFunc : (String, String) -> Int = {(num1: String, num2: String) in
        return (Int(num1) ?? 0) * (Int(num2) ?? 0) //oprFunc초기화는 *로
    }
    
    var body: some View {
        ZStack {
            //            Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255).ignoresSafeArea()
            // 제현님
            //            Color.black
            //                .ignoresSafeArea()
            // 현정님

            Color.black.edgesIgnoringSafeArea(.all)
            // 주헌님
            
            
            VStack {
                HStack{
                    Spacer()
                    VStack {
                        Group {
                            Text("first : \(firstNumber)")
                            Text("second : \(secondNumber)")
//                            Text("\(dummyNumber)")
                            Text("\(resultText)")
                        }
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                    }

                    

                }
                
                
                ForEach (0..<3) { index in
                    HStack{
                        ForEach (1..<4) { num in
                            Button {
                            
                                /*
                                 [num2 오류 해결부분]
                                 
                                 num2 형변환시 nil값이 들어갔던 이유 : 형 변환에 실패했기 때문
                                 opr버튼 클릭시 resultText를 " "으로 바꿔주는데,
                                 아래 82번 코드만 쓰게 된다면 공백+숫자를 num2에 할당하게 되는것.
                                 
                                 해결 : 위와 같은 이유로 Int형 변환에 실패했기 때문에 공백일때는 resultText에 숫자를 붙이는것이 아닌,
                                 숫자로 대체되도록 변경
                                 
                                 */
                                
                                if(resultText == " ") {
                                    resultText = "\((index*3)+num)"
                                }
                                else {
                                    resultText += "\((index*3)+num)"
                                }
                                
    
                            } label: {
                                ButtonView(buttonString: "\((index*3)+num)", buttonBG_Color: btnBG)
                            }
                        }
                        
                        Button {
                            isOPR = true
                            firstNumber = resultText
                            resultText = " "
                            checkOpr = index
//                            calculator(index: index)
        
                        } label: {
                            ButtonView(buttonString: "\(oprArray[index])", buttonBG_Color: .orange)
                        }
                        
                    }
                }
                HStack {
                    Button {
                        resultText = "0"
                        
                    } label: {
                        ButtonView(buttonString: "0", buttonBG_Color: btnBG, leadTrailling: 75)
                    }
                    Button {
                        
                    } label: {
                        ButtonView(buttonString: ".", buttonBG_Color: btnBG)
                    }
                    
                    Button {
                        isOPR = false
                        secondNumber = resultText
                        calculator(index: checkOpr)
                        resultText = "\(oprFunc(firstNumber, secondNumber))"
                        print("\(secondNumber)")
                        
                        
                        
                    } label: {
                        ButtonView(buttonString: "=", buttonBG_Color: .orange)
                    }
                  
                }
                
                
            }
            
        }
        
        
        
    }
    
    func calculator(index: Int) {
        switch index {
        case 0:
            oprFunc = {(num1: String, num2: String) -> Int in
                return (Int(num1) ?? 0) * (Int(num2) ?? 2) //oprFunc초기화는 *로
            }
        case 1:
            oprFunc = {(num1: String, num2: String) in
                return (Int(num1) ?? 0) + (Int(num2) ?? 2) //oprFunc초기화는 *로
            }
        case 2:
            oprFunc = {(num1: String, num2: String) in
                return (Int(num1) ?? 0) - (Int(num2) ?? 0) //oprFunc초기화는 *로
            }
        default:
            break
        }
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
