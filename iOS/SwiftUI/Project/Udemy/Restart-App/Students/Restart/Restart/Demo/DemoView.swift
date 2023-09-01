//
//  DemoView.swift
//  Restart
//
//  Created by LJh on 2023/09/01.
//

import SwiftUI


class DemoStore : ObservableObject{
  @Published var nameArray : [String] = ["첫번쨰","두번쨰"]
  
  func addName (name : String ){
    nameArray.append(name)
  }
}


struct DemoView: View {
  @ObservedObject var demoStore : DemoStore = DemoStore() // 1번쨰 인스턴스
  
  var body: some View {
    NavigationStack{
      NavigationLink {
        DemoView_2()
      } label: {
        Text("DemoStore를 줄거야!")
      }
    }
  }
}

struct DemoView_2 : View {
  @ObservedObject var newDemoStore : DemoStore = DemoStore() //두번쨰 인스턴스

  @ObservedObject var demoStore : DemoStore = DemoStore() // 첫번쨰 인스턴스
  // () 실행이다 .
  
  
  var text = "병구"
  var text2 = "병구"
  
  var body: some View {
    VStack {
      Button {
        
        newDemoStore.addName(name: "로봇팔!")
      } label: {
        Text("자 확인해 보는 버튼")
      }
      Text("새롭게 만든 인스턴스 ! ")
      ForEach(newDemoStore.nameArray,id: \.self){ name in
        Text("\(name)")
        
      }
      Button {
        demoStore.addName(name: "로봇팔!")
      } label: {
        Text("자 확인해 보는 버튼")
      }
      Text("앞뷰에서 가져온 인스턴스 ! ")
      ForEach(demoStore.nameArray,id: \.self){ name in
        Text("\(name)")
      }
    }
    
  }
}


struct DemoView_Previews: PreviewProvider {
  static var previews: some View {
    DemoView()
  }
}
