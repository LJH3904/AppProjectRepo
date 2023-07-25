//
//  CarStore.swift
//  ListNavDemo
//
//  Created by LJh on 2023/07/25.
//

import Foundation

class CarStore : ObservableObject {
  @Published var cars : [Car]

//  init(){//다형성 오버로딩 하나의 이름을 가지고 매개변수를 맘대로 다룬다.
//    self.cars = []
//  }
  init(cars : [Car] = []){ // 카를 따로 안받으면 빈 배열로 초기화
    self.cars = cars
  }
  func deleteItems(at offset : IndexSet){
    cars.remove(atOffsets: offset)
  }
  func moveItems(from source: IndexSet , to destination : Int){
    cars.move(fromOffsets: source, toOffset: destination)
  }
  func addNewCar(_ new: Car){
    //let newCar = Car(id: UUID().uuidString,name: name, description: description, isHybrid: isHybrid, imageName: "tesla_model_3")
    let newCar = new
    cars.append(newCar)
  }
}
