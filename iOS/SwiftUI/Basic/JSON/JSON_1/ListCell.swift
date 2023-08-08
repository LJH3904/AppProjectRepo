//
//  ListCell.swift
//  ListNavDemo
//
//  Created by LJh on 2023/07/25.
//

import SwiftUI

struct ListCell: View {
    @Binding var car : Car
    var body: some View {
        NavigationLink {
            CarDetail(selectedCar: $car)
        } label: {
            HStack{
                if car.isFavorite {
                    Image(systemName: "star.fill")
                        .renderingMode(.original)
                }
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
        ListCell(car: .constant(carData[0]))
    }
}
