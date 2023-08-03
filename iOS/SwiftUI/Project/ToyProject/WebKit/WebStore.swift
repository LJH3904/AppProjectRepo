//
//  WebStore.swift
//  Lab13
//
//  Created by LJh on 2023/08/03.
//

import Foundation

class WebStore : ObservableObject{
  
  @Published var webDatas : [Web] = []
  
  init(){
    webDatas = [
      Web(title: "네이버", urlString: "https://www.naver.com/", imageString: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTExMDJfMjkz%2FMDAxNjM1ODM1ODcwMDg5.MZF8sD2Z9c0mmlQC7-SdI4SyMgPG2VT1S56PeJLfBX4g.0jZADpIte_5d4rsRT_vdScyKxo-Hsc7SX4r8KQuBQ6Ag.PNG.ssunkyun5%2F%25B3%25D7%25C0%25CC%25B9%25F6_%25BF%25B9%25BE%25E0_%25B7%25CE%25B0%25ED.png&type=sc960_832")
      ,
      Web(title: "다음", urlString: "https://www.daum.net/", imageString: "https://play-lh.googleusercontent.com/qx1y7J8zCnIgF0YG3Nj2Q4vyLCJfdzNRaNCyANVT3iPeZId4IO8T_OFlbTmHPUzPws0")
      ,
      Web(title: "구글", urlString: "https://www.google.co.kr/?hl=ko", imageString: "https://cdn-icons-png.flaticon.com/512/2991/2991148.png")
    ]
  }
  
  func fetchWebDatas() {
    // UserDefaults의 데이터를 가져오는 국룰 코드
    do {
      // UserDefaults에서 "Stickers"라는 key의 값을 가져오는데
      // 이 value는 어떤 타입인지를 따로 알려주니는 않는다
      // JSON을 인코딩해서 Data 만들어 저장한거니까
      // 우리는 미리 이것이 Data 타입이라고 생각하고
      // 형 변환 (as? Data)과 관련된 if let 옵셔널 바인딩 처리로
      // 올바르게 Data 타입의 data 인스턴스가 잡혔을때만 관련 처리를 진행한다
      if let data = UserDefaults.standard.object(forKey: "WebDatas") as? Data {
        let decoder: JSONDecoder = JSONDecoder()
        webDatas = try decoder.decode([Web].self, from: data)
      }
    } catch {
      print("UserDefaults로 부터 데이터 가져오기 실패")
    }
  }
  func saveWebDatas() {
    // JSON으로 배열 등등의 복잡 데이터를 단일한 데이터로 만들어준다
    // 앞으로도 이런거 있으면 이 코드 복붙하자!
    do {
      let endcoder: JSONEncoder = JSONEncoder()
      let data: Data = try endcoder.encode(webDatas)
      
      // 지금은 UserDefaults에 저장하지만,
      // 나중엔 이 부분이 외부의 클라우드 등등에 접속하는 코드로
      // 다양하게 바뀔 수 있다
      UserDefaults.standard.set(data, forKey: "WebDatas")
    } catch {
      print("JSON 생성 후 UserDefaults 실패")
    }
  }
  func deleteItems(at offsets: IndexSet){
    webDatas.remove(atOffsets: offsets)
    saveWebDatas()
  }
  func moveItems(from source: IndexSet, to destination: Int){
    webDatas.move(fromOffsets: source, toOffset: destination)
  }
  func addItems(element: Web){
          webDatas.append(element)
    saveWebDatas()
  }
}
