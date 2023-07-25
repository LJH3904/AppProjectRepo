//
//  ContentView.swift
//  ListNavDemo
//
//  Created by LJh on 2023/07/25.
//

import SwiftUI

struct ContentView: View {
    
    
    //@ObservedObject var carStore : CarStore = CarStore()
    
    @ObservedObject var carStore : CarStore = CarStore(cars: carData)
    //이게 다형성
    // @State var likeCars:[Car] = self.carStore.cars.filter { $0.isFavorite }
    
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(Array(zip($carStore.cars,carStore.cars.indices)), id: \.1) { $car , idx in
                    ListCell(car: $car)
                    
                        .swipeActions(edge:.leading) {
                            
                            Button(role: .none) {
                                car.isFavorite.toggle()
                            } label: {
                                Image(systemName: "star")
                            }
                            
                        }
                    
                        .swipeActions(edge:.trailing) {
                            
                            Button() {
                                carStore.deleteItems(at: IndexSet(integer: idx))
                            } label: {
                                Image(systemName: "trash")
                            }
                            
                        }
                }
                
                .onMove(perform: carStore.moveItems)
            }//:List
            .navigationTitle(Text("EV Cars"))
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        AddNewCar(carStore: carStore)
                    } label: {
                        Text("ADD")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton() //ToolbarItem에서만 사용합니다~
                }
                
                ToolbarItem(placement: .bottomBar){
                    Image(systemName: "home")
                }
                
            }//toolbar
        }
    }
    //NavigationStack
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ContentView()
        }
    }
}


