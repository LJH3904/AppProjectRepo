//
//  ContentView.swift
//  SwiftUIList
//
//  Created by Jongwook Park on 2023/07/25.
//

import SwiftUI

struct ToDoItem: Identifiable {
    var id: UUID = UUID()
    var task: String
    var imageName: String
}

let listData: [ToDoItem] = [
    ToDoItem(task: "이불 정리", imageName: "bed.double.fill"),
    ToDoItem(task: "책상 정리", imageName: "studentdesk"),
    ToDoItem(task: "아침밥 먹기", imageName: "takeoutbag.and.cup.and.straw.fill"),
    ToDoItem(task: "양치하기", imageName: "smiley.fill"),
]

struct ContentView: View {
    
    @State private var toggleStatus: Bool = true
    
    var body: some View {
        NavigationStack {
            List {
                Section("설정") {
                    Toggle(isOn: $toggleStatus) {
                        Text("알림 허용")
                    }
                }
                
                Section("할 일") {
                    ForEach(listData) { item in
                        
                        NavigationLink {
                            VStack {
                                Image(systemName: "\(item.imageName)")
                                    .padding()
                                Text("\(item.task)")
                            }
                            .font(.largeTitle)
                        } label: {
                            HStack {
                                Image(systemName: "\(item.imageName)")
                                Text("\(item.task)")
                            }
                        }

                    }
                    .onDelete { indexSet in
                        deleteItem(at: indexSet)
                    }
                    .onMove { indexSet, index in
                        print("\(indexSet), \(index) 내용 이동합니다")
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("해야할 일")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .refreshable {
                print("새로고치겠습니다")
            }
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        print("\(offsets)를 삭제하려합니다.")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
