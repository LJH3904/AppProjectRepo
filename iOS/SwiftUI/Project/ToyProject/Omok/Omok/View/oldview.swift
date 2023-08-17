//
//  ContentView.swift
//  Omok
//
//  Created by LJh on 2023/08/17.
//


import SwiftUI
import Firebase
import FirebaseDatabase
struct ContentView: View {
  //MARK: - Properties
  @State var dbRef = Database.database().reference().child("dol")
  
  @State var stone : [[String]] = Array(repeating: Array(repeating: "", count: 15), count: 15)
  @State var table : [[String]] = Array(repeating: Array(repeating: "plus", count: 15), count: 15)
  @State var turn : Bool = true
  var direction = [1,-1]
  
  //MARK: - func
  func check(y: Int, x: Int) -> Bool {
    
    func checkX(y: Int, x: Int) -> Bool {
      var queue = [(y,x)]
      var count = 0
      while !queue.isEmpty {
        let yx = queue.removeFirst(), x = yx.1
        for i in 0..<2 {
          let mx = x + direction[i]
          
          guard mx>=0 && mx<stone[0].count else { continue }
          guard stone[y][mx] == stone[y][x] else { continue }
          queue.append((y,mx))
          count += 1
        }
      }
      return count >= 5 ? true : false
    }
    
    func checkY(y: Int, x: Int) -> Bool {
      var queue = [(y,x)]
      var count = 0
      while !queue.isEmpty {
        let yx = queue.removeFirst(), y = yx.0
        for i in 0..<2 {
          let my = y + direction[i]
          
          guard my>=0 && my<stone.count else { continue }
          guard stone[my][x] == stone[y][x] else { continue }
          queue.append((my,x))
          count += 1
        }
      }
      return count >= 5 ? true : false
    }
    
    let a = checkX(y: y, x: x)
    let b = checkY(y: y, x: x)
    
    return a || b
  }
  
  
  
  func settingStart(){
    dbRef.child("dol").setValue(Array(repeating: Array(repeating: "", count: 15), count: 15))
    dbRef.child("turn").child("true").setValue("true")
    
    //뷰 초기세팅
    stone = Array(repeating: Array(repeating: "", count: 15), count: 15)
    table = Array(repeating: Array(repeating: "plus", count: 15), count: 15)
    turn = true
  }
  
  
  
  func changeTurn() {
    turn.toggle()
    dbRef.child("turn").child("true").setValue(turn)
    dbRef.child("turn").child("true").observe(.value) { snapshot in
      if let value = snapshot.value as? Bool {
        
        DispatchQueue.main.async {
          self.turn = value
//          print("DispatchQueue 안에 turn.true의 값:\(self.turn)")
        }
      }
    }
//    print("turn 의 값:\(turn)")
  }
  
  
  
  
  func pressedStoneButton (y : Int , x : Int){
    if turn {
      //흑돌
      stone[y][x] = "x.circle"
      table[y][x] = ""
      dbRef.child("dol").child("\(y)").child("\(x)").setValue(stone[y][x])
      
    }else{
      //백돌
      stone[y][x] = "o.circle"
      table[y][x] = ""
      dbRef.child("dol").child("\(y)").child("\(x)").setValue(stone[y][x])
      
    }
    dbRef.child("dol").child("\(y)")
      .child("\(x)").observe(.value) { snapshot in
        if let value = snapshot.value as? String {
          DispatchQueue.main.async {
            self.stone[y][x] = value
//            print("DispatchQueue 안에 dol[y][x]의 값:\(self.dol[y][x])")
          }
        }
      }
//    print("dol[y][x]의 값:\(dol[y][x])")
  }
  
  
  //MARK: - body
  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()
      Grid{
        VStack {
          //MARK: - ViewHeader

          Text(turn ? "OOOOOOOOOO": "XXXXXXXXXX")
            .foregroundColor(.white)
            .fontWeight(.heavy)
            .font(.title)
          ForEach(0..<15){ y in
            HStack {
              ForEach(0..<15) { x in
                GridRow{
                  ZStack {
                    //MARK: - ViewBody
                    Image(systemName: table[y][x])
                      .resizable()
                      .scaledToFit()
                      .foregroundColor(.white)
                    Button {
                      guard stone[y][x] == "" else{
                        return
                      }
                      pressedStoneButton(y: y, x: x)
                      //Turn
                      changeTurn()
                    } label: {
                      Image(stone[y][x])
                        .resizable()
                        .scaledToFit()
                        .fontWeight(.bold)
                        
                    }//: Button
                  }//: Zstack
                }//:GridRow
              }
            }//: HStack
          }
          //MARK: - ViewFooter

          Button {
            //db 초기세팅
            settingStart()
          } label: {
            Text("게임시작")
              .foregroundColor(.white)
              .fontWeight(.heavy)
              .font(.title)
          }
        }//: VStack
      }//: Grid
    }//: ZSTACK
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
