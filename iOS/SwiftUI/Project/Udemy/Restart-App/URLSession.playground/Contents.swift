import UIKit

let url = URL(string: "https://www.naver.com")!
//URLSession으 URLSession.shared라는 싱클톤 패턴의 공통 인스턴스 호출로 진행하는 것이 보통이다.
//response 는 숫자에 따라 웹의 응답을 받는 공간잇다.
//error 에러에 대한 것을 받는 것이다 .
/*
let task : URLSessionDataTask = URLSession.shared.dataTask(with: url){ (data,response,error) in
  guard let data = data else {
    print("Nothing")
    return
  }
  //iOS의 String은 보통 UTF-16으로 구성되기 떄문에
  //UTF-8 형식으로 문자가0 적힌 데이터를 가져와 변환하는 게 필요하다.
  print(String(data: data, encoding: .utf8)!)
  print("진행완료")
  
}

print("진행ㅣ켜")
task.resume()
*/

func fetchData(from url : URL) async -> Data? {
  do{
    let (data,response) = try await URLSession.shared.data(from: url)
    print("\(response)")
    return data
  }catch{
    return nil
  }
}
  //async가 붙은 함수를 실행한느 대표적인 방법
//task를 만들어 그 안에서 진행하는 것이다.
Task{
  if let data = await fetchData(from: url){
    print(String(data: data, encoding: .utf8)!)
  }else{
    print("nothing")
  }
  for _ in 0..<5 {
    print("인터넷작업중")
  }
}



//@propertyWrapper
//struct TenTimes {
//  private var value : Int = 0
//  var wrappedValue : Int {
//    get { value * 10 }
//    set { value = newValue}
//  }
//}
//struct MyNumbers {
//  @TenTimes var _integer : Int
//  var double : Double = 13.4
//
//}
//
//var mine : MyNumbers = MyNumbers()
//
//mine._integer = 5
//print(mine._integer)
