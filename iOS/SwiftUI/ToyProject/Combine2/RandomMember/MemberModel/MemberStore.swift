//
//  MemberStore.swift
//  RandomMember
//
//  Created by LJh on 2023/07/06.
//

import Foundation
import Combine

class MemberStore : ObservableObject {
  @Published var members : [Member] = []
  //member가 변경이 되면 뷰쪽에 다른 속성래퍼로 되어있는 애한테 알려준다 (바꿔준다 읺스턴스의 값을)
 
  var randomMember : Member {
    members.randomElement() ?? Member(name: "없는멤버")
  }
  var membersEmpty : Bool {
   members.isEmpty
  }
  
  init(){
//    members = [
//    Member(name: "이제현1"),
//    Member(name: "이제현2"),
//    Member(name: "이제현3"),
//    Member(name: "이제현4"),
//    Member(name: "이제현5"),
//    ]
  }
  func addMember(name : String){
    let member : Member = Member(name: name)
    members.append(member)
  }
  
  func deleteMember(_ member : Member ){
    members.removeAll(where: { $0.id == member.id} )
  }
  
  func removeMembersAll(){
    members.removeAll()
  }
}
