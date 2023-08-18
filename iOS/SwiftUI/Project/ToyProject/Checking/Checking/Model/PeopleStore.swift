//
//  PeopleStore.swift
//  Checking
//
//  Created by LJh on 2023/08/18.
//

import Foundation

class PeopleStore : ObservableObject {
  
  @Published var peoples : [People] = []
  @Published var delPeople : [People] = []
  
  
  //MARK: - People
  
  func fetchUser() {
    // UserDefaults의 데이터를 가져오는 국룰 코드
    do {
      // UserDefaults에서 "Stickers"라는 key의 값을 가져오는데
      // 이 value는 어떤 타입인지를 따로 알려주니는 않는다
      // JSON을 인코딩해서 Data 만들어 저장한거니까
      // 우리는 미리 이것이 Data 타입이라고 생각하고
      // 형 변환 (as? Data)과 관련된 if let 옵셔널 바인딩 처리로
      // 올바르게 Data 타입의 data 인스턴스가 잡혔을때만 관련 처리를 진행한다
      if let data = UserDefaults.standard.object(forKey: "People") as? Data {
        let decoder: JSONDecoder = JSONDecoder()
        peoples = try decoder.decode([People].self, from: data)
      }
    } catch {
      print("UserDefaults로 부터 데이터 가져오기 실패")
    }
  }
  
  func saveUser() {
        do {
            let endcoder: JSONEncoder = JSONEncoder()
            let data: Data = try endcoder.encode(peoples)
            print("save")
            UserDefaults.standard.set(data, forKey: "People")
        } catch {
            print("JSON 생성 후 UserDefaults 실패")
        }
  }
  //MARK: - DelPeople
 
  func fetchdelPeople() {
    do {
      if let data = UserDefaults.standard.object(forKey: "DelPeople") as? Data {
        let decoder: JSONDecoder = JSONDecoder()
        delPeople = try decoder.decode([People].self, from: data)
      }
    } catch {
      print("UserDefaults로 부터 데이터 가져오기 실패")
    }
  }
  func saveDelPeople() {
        do {
            let endcoder: JSONEncoder = JSONEncoder()
            let data: Data = try endcoder.encode(delPeople)
            print("save")
            UserDefaults.standard.set(data, forKey: "DelPeople")
        } catch {
            print("JSON 생성 후 UserDefaults 실패")
        }
  }
  //MARK: - array
 
  func resetAll(){
    let temp = loadJson("FinalSheet.json")
    peoples = temp
    delPeople.removeAll()
    saveUser()
    saveDelPeople()
  }
  
  func deletePeople(at offset : IndexSet){
      peoples.remove(atOffsets: offset)
    saveUser()
  }
  
  func deleteMonster(_ people : People){
    peoples.removeAll(where: { $0.name == people.name})
    saveUser()
  }
  
  func addDelPeople ( _ ppl : People){
    delPeople.append(ppl)
    saveDelPeople()
  }
  
  
  //MARK: - JSON

  func fetchProduct () {
    peoples = loadJson("FinalSheet.json")
    fetchUser()
  }
  func loadJson(_ filename: String) -> [People] {
    let data: Data
    guard let file: URL = Bundle.main.url(forResource: filename, withExtension: nil) else {
      fatalError("\(filename) not found.")
    }
    
    do {
      data = try Data(contentsOf: file)
    } catch {
      fatalError("Could not load \(filename): \(error)")
    }
    
    do {
      return try JSONDecoder().decode([People].self, from: data)
    } catch {
      fatalError("Unable to parse \(filename): \(error)")
    }
    
  }
}
