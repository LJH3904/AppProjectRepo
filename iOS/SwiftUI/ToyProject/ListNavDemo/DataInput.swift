//
//  DataInput.swift
//  ListNavDemo
//
//  Created by LJh on 2023/07/25.
//

import SwiftUI


struct DataInput : View {
  
  var title : String
  
  @Binding var userInput : String
  
  var body: some View{
    VStack(alignment: HorizontalAlignment.leading) {
      Text(title)
        .font(.headline)
      TextField("Enter \(title)", text: $userInput)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      
    }
    .padding()
  }
}
struct DataInput_Previews: PreviewProvider {
    static var previews: some View {
      DataInput(title: "ss", userInput: .constant("123"))
      //.constant 바인딩 된 변수를 프리뷰에 쓸 때 사용
    }
}
