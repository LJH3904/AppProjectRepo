
import Foundation


struct Product: Codable,Hashable {
  
    var rowno: String
    let sellyear: String
    let sellmonth : String
    let seltnstd: Seltnstd
    let prdtnm: String
  
}

enum Seltnstd: String, Codable , CaseIterable {
    case 금액 = "금액"
    case 수량 = "수량"
}
