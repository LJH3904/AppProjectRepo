//
//  CarDetail.swift
//  ListNavDemo
//
//  Created by LJh on 2023/07/25.
//

import SwiftUI

struct CarDetail: View {
  
  let selectedCar : Car

  var body: some View {
    Form{ //List form 뭔차일까
      /*
       Form은 데이터 입력과 설정을 위해 사용되는 주로 세로로 스크롤되는 스타일의 뷰입니다.
       - 틀있는형식 데이터 입력과설정 (대화방,)
       List는 주로 컬렉션을 보여주는 뷰로, 여러 개의 항목을 스크롤 가능한 목록으로 표시할 때 사용됩니다. 해당 항목을 선택하거나 상호작용하는 데 사용됩니다.
       - 컬렉션 스크롤이 가능한 아이템들 나열하게 할떄? (음식리스트?)
       */
      Section {
        Image(selectedCar.imageName)
          .resizable()
          .cornerRadius(12.0)
          .aspectRatio(1,contentMode: .fit)
          .padding()
        
        Text(selectedCar.name)
          .font(.headline)
        
        Text(selectedCar.description)
          .font(.body)
        
        HStack{
          Text("Hybrid")
            .font(.headline)
          Spacer()
          Image(systemName:selectedCar.selectedCarHybridImage)
        }
      } header: {
        Text("Car Details")
      }
      
      Section{
        HStack{
          Text("isHappy")
            .font(.headline)
          Spacer()
          Image(systemName:selectedCar.selectedCarHybridImage)
        }
      } header: {
        Text("Hi")
      }
      
    }
  }
}

struct CarDetail_Previews: PreviewProvider {
  static var previews: some View {
    CarDetail(selectedCar: carData[0])
  }
}
