import SwiftUI

struct NumberGame3: View {
    @State var answerCount = 0
    @State private var pickerSelectNum : [Int] = [0,0,0,0,0]
    @State var randomIntArray : [Int] = [
        Int.random(in: 0...9),
        Int.random(in: 0...9),
        Int.random(in: 0...9),
        Int.random(in: 0...9),
        Int.random(in: 0...9)
    ]
    
    var body: some View {
        VStack {
          if getAnswer() == 5 {
            Text("다 맞췄습니다!").font(.largeTitle)
          }else{
            Text("\(getAnswer())개 맞췄습니다!.").font(.largeTitle)
              
          }
          Text("현재 선택은 : \(getSelectNum()) 입니다.")
     
            Picker("Selecta num?", selection: $pickerSelectNum[0]){
                ForEach(0..<11){ num in
                    Text("\(num)")
                }
            }.pickerStyle(.segmented)
            
            Picker("Selecta num?", selection: $pickerSelectNum[1]){
                ForEach(0..<11){ num in
                    Text("\(num)")
                }
            }.pickerStyle(.segmented)
            
            Picker("Selecta num?", selection: $pickerSelectNum[2]){
                ForEach(0..<11){ num in
                    Text("\(num)")
                }
            }.pickerStyle(.segmented)
            
            Picker("Selecta num?", selection: $pickerSelectNum[3]){
                ForEach(0..<11){ num in
                    Text("\(num)")
                }
            }.pickerStyle(.segmented)
            Picker("Selecta num?", selection: $pickerSelectNum[4]){
              ForEach(0..<11){ num in
                  Text("\(num)")
              }
          }.pickerStyle(.segmented)
          
          Button("reset") {
            randomIntArray.removeAll()
            pickerSelectNum = Array(repeating: 0, count: 5)
            for _ in 0...4{
              randomIntArray.append(Int.random(in: 0...10))
            }
          }.font(.largeTitle)
        }
      
    }
}

struct NumberGame3_Previews: PreviewProvider {
    static var previews: some View {
        NumberGame3()
    }
}

extension NumberGame3{
    func getSelectNum() -> String{
        let temp : String = pickerSelectNum.map {String($0) }.joined(separator: ",")
        return temp
    }
    
    func getAnswer() -> Int {
        var count = 0
        for i in  0..<pickerSelectNum.count {
            if pickerSelectNum[i] == randomIntArray[i] {
                count += 1
            }
        }
        return count
    }
    
  
}
