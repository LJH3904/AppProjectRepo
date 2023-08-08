//
//  CarStore.swift
//  ListNavDemo
//
//  Created by LJh on 2023/07/25.
//

import Foundation

class CarStore : ObservableObject {
    @Published var cars : [Car]
    
    init(cars : [Car] = []){ // 카를 따로 안받으면 빈 배열로 초기화
        self.cars = cars
    }
    
    func deleteItems(at offset : IndexSet){
        cars.remove(atOffsets: offset)
    }
    
    func moveItems(from source: IndexSet , to destination : Int){
        cars.move(fromOffsets: source, toOffset: destination)
    }
    
    func addNewCar
    (_ newCar: Car){
        cars.append(newCar)
    }
    
}
