//
//  ContentView.swift
//  Checking
//
//  Created by LJh on 2023/08/18.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var peopleStore : PeopleStore = PeopleStore()
  @State var searchName = ""
  
  @State var isShowingShee = false
  @State var isShowingDelPeopleListView = false
  @State var isShowingAddView = false
  @State var switchTextArray : [String] = [
    "오후 5시 탑승",
    "오후 4시 탑승",
    "오후 7시 탑승",
    "탑승하지 않음 (자차 이용 등, 개인이 알아서 도착)"
  ]

  @State var switchText = ""
  var body: some View {
    VStack{
      Text("확인 해야할 사람 숫자 : \(peopleStore.peoples.count) ")
        .font(.title)
      Spacer()
      List{
        ForEach(peopleStore.peoples , id: \.self ){ people in
          if people.Departure == "오후 5시 탑승" {
            VStack(alignment: .leading, spacing: 10 ){
              
              Text("이름 : \(people.name)")
              Text("출발 : \(people.Departure)")
              Text("소속 : \(people.organization)")
            }
            
          }
        }
      }
      HStack{
        //        ForEach(switchTextArray,id: \.self){ index in
        //
        //          Button {
        //            switchText = index
        //          } label: {
        //            Text("\(index == "탑승하지 않음 (자차 이용 등, 개인이 알아서 도착)" ? "탑승하지 않음 ": index)")
        //              .multilineTextAlignment(.center)
        //              .frame(maxHeight: 100)
        //              .padding()
        //          }
        //        }
        //      }
        
          Spacer()
          Button {
            peopleStore.resetAll()
            searchName = ""
          } label: {
            Text("전체\(Image(systemName: "trash"))")
          }
          Spacer()
          Button {
            isShowingAddView = true
          } label: {
            Text("인원 추가")
          }
          Spacer()
          Button {
            isShowingDelPeopleListView = true
          } label: {
            Text("삭제된 리스트")
          }
        Spacer()
      }.padding(.all,20)
      
      
      HStack {
        TextField("이름검색", text: $searchName)
          .textFieldStyle(.roundedBorder)
          
        Spacer()
        Button {
          
          isShowingShee = true
          
        } label: {
          Text("\(Image(systemName: "magnifyingglass"))")
        }
        Spacer()
      }.padding()
        .onTapGesture {
          hideKeyboard()
        }

    }
    .sheet(isPresented: $isShowingShee, content: {
      SearchView(peopleStore: peopleStore, searchName: $searchName, isShowingshee: $isShowingShee)
      
    })
    .sheet(isPresented: $isShowingDelPeopleListView, content: {
      DelPeopleListView(DelPeople: peopleStore, isShowingDelPeopleListView: $isShowingDelPeopleListView)
    }
    )
    .sheet(isPresented: $isShowingAddView, content: {
      AddView(peopleStore: peopleStore, isShowingAddView: $isShowingAddView)
    }
    )

    .onAppear(){
      peopleStore.fetchUser()
      peopleStore.fetchProduct()
      peopleStore.fetchdelPeople()
      
    }
  
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
extension View {
  func hideKeyboard() {
      UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
