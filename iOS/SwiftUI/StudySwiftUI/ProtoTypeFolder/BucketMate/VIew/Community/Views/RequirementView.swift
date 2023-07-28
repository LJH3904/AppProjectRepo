//
//  RequirementView.swift
//  BucketMate
//
//  Created by gnksbm on 2023/07/27.
//

import SwiftUI

struct RequirementView: View {
    @ObservedObject var slider = CustomSlider(start: 1, end: 300)
    @State var requirement: Requirement = Requirement(locationString: "지역을 선택하세요", minBudget: 100000, maxBudget: 9000000, firstDate: Date(), lastDate: Date(timeInterval: 86400, since: .now), gender: .none, tendency: .none, purpose: .none, bucketList: .none)
    
    @State var showAlert: Bool = false
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("가고싶은 지역")
                    HStack {
                        Text(requirement.locationString)
                            .padding(.leading)
                        Spacer()
                        Button {
                            showAlert = true
                        } label: {
                            Image(systemName: "map")
                                .foregroundColor(.bucketColor)
                                .fontWeight(.bold)
                                .padding()
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("지역선택"), primaryButton: .default(Text("선택하기")) {
                                requirement.locationString = "대한민국 🇰🇷"
                            }, secondaryButton: .default(Text("취소")))
                        }
                    }
                    .foregroundColor(.white)
                    .background(Color(red: 0.01, green: 0.01, blue: 0.01).opacity(0.5))
                    .cornerRadius(10)
                    .padding(.bottom, 30)
                    Text("예산 경비: \(Int(slider.lowHandle.currentValue) * 100000) ~ \(Int(slider.highHandle.currentValue) * 100000)")
                    DualHandleSliderView(slider: slider)
                        .padding()
                        .padding(.bottom, 30)
                    Label("기간 \(requirement.period)", systemImage: "calendar")
                    HStack {
                        DatePicker(selection: $requirement.firstDate, displayedComponents: .date) {
                        }.position(x: .screenWidth / 10, y: UIScreen.main.bounds.height / 50)
                        DatePicker(selection: $requirement.lastDate, displayedComponents: .date) {
                            Text("~")
                        }.position(x: .screenWidth / 5, y: UIScreen.main.bounds.height / 50)
                    }
                    .padding(.bottom, 30)
                    RequirementPickerView(requirement: $requirement, name: Gender.title, list: Gender.allCases.map { $0.rawValue }
                        .filter { $0 != "" } , isMultipleSelect: false)
                    RequirementPickerView(requirement: $requirement, name: Tendency.title, list: Tendency.allCases.map { $0.rawValue }
                        .filter { $0 != "" } )
                    RequirementPickerView(requirement: $requirement, name: Purpose.title, list: Purpose.allCases.map { $0.rawValue }
                        .filter { $0 != "" } )
                    RequirementPickerView(requirement: $requirement, name: BucketList.title, list: BucketList.allCases.map { $0.rawValue }
                        .filter { $0 != "" } )
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isPresented = false
                        } label: {
                            Text("완료")
                                .foregroundColor((requirement.locationString == "지역을 선택하세요" ||
                                                  requirement.gender == .none ||
                                                  requirement.tendency == .none ||
                                                  requirement.purpose == .none ||
                                                  requirement.bucketList == .none) ? .gray : .bucketColor)
                        }
                        .disabled(
                            requirement.locationString == "지역을 선택하세요" ||
                            requirement.gender == .none ||
                            requirement.tendency == .none ||
                            requirement.purpose == .none ||
                            requirement.bucketList == .none
                        )
                    }
                }
            }
        }
        .onAppear {
            print(requirement.period)
        }
        .padding()
    }
}

struct RequirementView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RequirementView(isPresented: .constant(true))
        }
    }
}
