//
//  Model.swift
//  iOS_060_LeeJeHyeon
//
//  Created by LJh on 2023/08/13.
//

import Foundation

struct Model : Identifiable{
  var id: UUID = UUID()
  let name : String
  let urlString : String
  var url : URL {
    return URL(string: urlString)!
  }
}

class Store :ObservableObject{
  
  @Published var stationStore : [Model] = []
  @Published var ottStore : [Model] = []
  @Published var git : Model = Model(name: "Git", urlString: "https://github.com/APPSCHOOL3-iOS")
  
  
  init(){
    stationStore = [
      Model(name: "KBS", urlString: "https://www.kbs.co.kr"),
      Model(name: "MBC", urlString: "http://imbc.com"),
      Model(name: "SBS", urlString: "https://sbs.co.kr"),
    ]
    ottStore = [
      Model(name: "Netflix", urlString: "https://www.netflix.com"),
      Model(name: "Disney+", urlString: "https://disneyplus.com"),
      
    ]
    
  }
}
