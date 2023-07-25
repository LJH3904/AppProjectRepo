//
//  CarDetail.swift
//  ListNavDemo
//
//  Created by LJh on 2023/07/25.
//

import SwiftUI

struct CarDetail: View {
    
    @Binding var selectedCar : Car
    
    var body: some View {
        Form{
            Section {
                Image(selectedCar.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(1,contentMode: .fit)
                    .padding()
                HStack{
                 
                    Text(selectedCar.name)
                        .font(.headline)
                    Spacer()
                    Button {
                        selectedCar.isFavorite.toggle()
                    } label: {
                        Image(systemName: selectedCar.isFavorite ? "star.fill" : "star")
                    }
                }
                
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
        }
    }
}

struct CarDetail_Previews: PreviewProvider {
    static var previews: some View {
        CarDetail(selectedCar: .constant(carData[0]))
    }
}
