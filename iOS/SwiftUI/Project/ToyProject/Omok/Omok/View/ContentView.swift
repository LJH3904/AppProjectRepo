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
  
  var nowUser : String {
    return turn ? "x.circle" : "o.circle"
  }
  
  @State var iswinner : String = ""
  //MARK: - func
  func isWin(y: Int, x: Int , winner : String){
    // 세로
    for y in 0..<11{
      for x in 0..<15{
        if stone[y][x] == nowUser
            && stone[y+1][x] == nowUser
            && stone[y+2][x] == nowUser
            && stone[y+3][x] == nowUser
            && stone[y+4][x] == nowUser{
          iswinner = "승자는 \(winner)"
          
          return
        }
      }
    }
    
    // 가로
    for x in 0..<11{
      for y in 0..<15{
        if stone[y][x] == nowUser
            && stone[y][x+1] == nowUser
            && stone[y][x+2] == nowUser
            && stone[y][x+3] == nowUser
            && stone[y][x+4] == nowUser{
          iswinner = "승자는 \(winner)"
          
          return
        }
      }
    }
    
    // 왼대각
    for y in 0..<11{
      for x in 0..<11{
        if stone[y][x] == nowUser
            && stone[y+1][x+1] == nowUser
            && stone[y+2][x+2] == nowUser
            && stone[y+3][x+3] == nowUser
            && stone[y+4][x+4] == nowUser{
          iswinner = "승자는 \(winner)"
          
          return
        }
      }
    }
    
    //우대각
    for y in 0..<11{
      for x in 0..<11{
            if nowUser == stone[15 - y-1][x]
            && nowUser == stone[15 - y-2][x+1]
            && nowUser == stone[15 - y-3][x+2]
            && nowUser == stone[15 - y-4][x+3]
            && nowUser == stone[15 - y-5][x+4]
            {
              iswinner = "승자는 \(winner)"
              
          return
        }
      }
    }
  }
 
  func settingStart(){
    for y in 0..<15 {
      for x in 0..<15 {
        dbRef.child("dol").child("\(y)").child("\(x)").setValue("")
      }
    }
    
    //뷰 초기세팅
    stone = Array(repeating: Array(repeating: "", count: 15), count: 15)
    table = Array(repeating: Array(repeating: "plus", count: 15), count: 15)
    turn = true
    dbRef.child("turn").child("true").setValue(turn)
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
      stone[y][x] = nowUser
      table[y][x] = ""
      dbRef.child("dol").child("\(y)").child("\(x)").setValue(stone[y][x])
      
    }else{
      //백돌
      stone[y][x] = nowUser
      table[y][x] = ""
      dbRef.child("dol").child("\(y)").child("\(x)").setValue(stone[y][x])
      
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
          
          Text("\(iswinner)")
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
                      isWin(y: y, x: x , winner: nowUser)
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
            iswinner = ""
          } label: {
            Text("게임시작")
              .foregroundColor(.white)
              .fontWeight(.heavy)
              .font(.title)
          }
        }//: VStack
      }//: Grid
    }//: ZSTACK
    .onAppear {
      appear()
    }
  }
  
  func appear() {
    for y in 0..<15 {
      for x in 0..<15 {
        dbRef.child("dol").child("\(y)").child("\(x)").observe(.value) { sanpshot, arg in
          if let value = sanpshot.value as? String {
            DispatchQueue.main.async {
              if value == "" {
                self.table[y][x] = "plus"
                self.stone[y][x] = value
              } else {
                
                self.stone[y][x] = value
                self.table[y][x] = ""
              }
              
            }
            
          }
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
















































//var direction = [1,-1]
////
//  func check(y: Int, x: Int) -> Bool {
//
//    func checkX(y: Int, x: Int) -> Bool {
//      var queue = [(y,x)]
//      var count = 0
//      while !queue.isEmpty {
//        let yx = queue.removeFirst(), x = yx.1
//        for i in 0..<2 {
//          let mx = x + direction[i]
//
//          guard mx>=0 && mx<stone[0].count else { continue }
//          guard stone[y][mx] == stone[y][x] else { continue }
//          queue.append((y,mx))
//          count += 1
//        }
//      }
//      return count >= 5 ? true : false
//    }
//
//    func checkY(y: Int, x: Int) -> Bool {
//      var queue = [(y,x)]
//      var count = 0
//      while !queue.isEmpty {
//        let yx = queue.removeFirst(), y = yx.0
//        for i in 0..<2 {
//          let my = y + direction[i]
//
//          guard my>=0 && my<stone.count else { continue }
//          guard stone[my][x] == stone[y][x] else { continue }
//          queue.append((my,x))
//          count += 1
//        }
//      }
//      return count >= 5 ? true : false
//    }
//
//    let a = checkX(y: y, x: x)
//    let b = checkY(y: y, x: x)
//
//    return a || b
//  }

