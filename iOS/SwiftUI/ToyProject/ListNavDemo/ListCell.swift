//
//  ListCell.swift
//  ListNavDemo
//
//  Created by LJh on 2023/07/25.
//

import SwiftUI

struct ListCell: View {
  var car : Car
  var body: some View {
    NavigationLink {
      CarDetail(selectedCar: car)
    } label: {
      HStack{
        Image(car.imageName)
          .resizable()
          .aspectRatio(CGSize(width: 1.6, height: 1), contentMode: .fill) // 앞에 아규먼트 는 비율을 조절할까?
          .frame(width: 100,height: 60)
        Text(car.name)
      }
    }

    
  }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
      ListCell(car: carData[0])
    }
}
