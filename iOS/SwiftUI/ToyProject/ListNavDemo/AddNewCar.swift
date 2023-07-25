//
//  AddNewCar.swift
//  ListNavDemo
//
//  Created by LJh on 2023/07/25.
//

import SwiftUI

struct AddNewCar: View {
  
  @ObservedObject var carStore : CarStore
  @Environment(\.dismiss) private var dismiss 
  @State var isHybrid = false
  @State var name :String = ""
  @State var description : String = ""
  
  var body: some View {
    Form {
      
      Section {
        Text("Car Details")
        Image(systemName: "car.fill")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .padding()
        
        DataInput(title: "Model", userInput: $name)
        DataInput(title: "Description", userInput: $description)
        
        Toggle(isOn: $isHybrid) {
          Text("Hybrid").font(.headline)
        }.padding()
      }
      
      Button {
        carStore.addNewCar(Car(id: UUID().uuidString,name: name, description: description, isHybrid: isHybrid, imageName: "tesla_model_3"))
        dismiss()
      } label: {
        Text("ADD")
      }
      
    }// form
  }
  
  
  
}



struct AddNewCar_Previews: PreviewProvider {
  static var previews: some View {
    AddNewCar(carStore: CarStore(cars: carData))
  }
}
