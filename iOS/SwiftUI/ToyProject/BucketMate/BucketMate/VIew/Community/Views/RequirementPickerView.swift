//
//  RequirementPickerView.swift
//  BucketMate
//
//  Created by gnksbm on 2023/07/27.
//

import SwiftUI

struct RequirementPickerView: View {
    @Binding var requirement: Requirement
//    = Requirement(locationString: "지역을 선택하세요", minBudget: 100000, maxBudget: 9000000, firstDate: Date(), lastDate: Date(timeInterval: 86400, since: .now), gender: .none, tendency: .none, purpose: .none, bucketList: .none)

    @State var name: String
    @State var list: [String]
    @State var selectedData: String = ""
    @State var selectedDatas: [String] = []
    
    var isMultipleSelect: Bool = true
    let gridItems: [GridItem] = [GridItem()]
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
//            if isMultipleSelect {
                LazyHGrid(rows: gridItems) {
                    ForEach(Array(zip(list, list.indices)), id: \.1) { name, index in
                        Button(name) {
                            switch name {
                            case Tendency.extroverted.rawValue, Tendency.impulsive.rawValue, Tendency.methodical.rawValue, Tendency.rational.rawValue:
                                requirement.tendency = Tendency(rawValue: name)!
                                print(Tendency(rawValue: name)!)
                            case Purpose.foodExploration.rawValue, Purpose.activities.rawValue, Purpose.hocance.rawValue, Purpose.sightseeing.rawValue:
                                requirement.purpose = Purpose(rawValue: name)!
                                print(Purpose(rawValue: name)!)
                            case BucketList.oneMonthStay.rawValue, BucketList.remoteExploration.rawValue, BucketList.skyDiving.rawValue, BucketList.underwaterExploration.rawValue:
                                requirement.bucketList = BucketList(rawValue: name)!
                                print(BucketList(rawValue: name)!)
                            case Gender.both.rawValue, Gender.dontCare.rawValue, Gender.onlyMan.rawValue, Gender.onlyWonam.rawValue:
                                requirement.gender = Gender(rawValue: name)!
                            default:
                                break
                            }
                            if selectedDatas.contains(list[index]) {
                                selectedDatas.remove(at: selectedDatas.firstIndex(of: name)!)
                            } else {
                                selectedDatas.append(list[index])
                            }
                        }
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.black)
                        .frame(width: 84, height: 30)
                        .background(selectedDatas.contains(list[index]) ? Color.bucketColor : .gray)
                        .cornerRadius(20)
                    }
                }
//            } else {
//                Picker(name, selection: $selectedData) {
//                    ForEach(list, id: \.self) { data in
//                        Button {
//                            selectedData = data
//                        } label: {
//                            Text(data)
//                                .cornerRadius(10)
//                                .background(selectedData == data ? Color.bucketColor : Color.buttonColor)
//                        }
//                    }
//                }
//                .pickerStyle(SegmentedPickerStyle())
//            }
            Divider()
                .padding(.vertical)
        }
        .padding(.bottom, 30)
    }
}

struct RequirementPickerView_Previews: PreviewProvider {
    static var previews: some View {
        RequirementPickerView(requirement: .constant(Requirement(locationString: "지역을 선택하세요", minBudget: 100000, maxBudget: 9000000, firstDate: Date(), lastDate: Date(timeInterval: 86400, since: .now), gender: .none, tendency: .none, purpose: .none, bucketList: .none)), name: "성별", list: ["남자만", "여자만", "남녀혼성", "상관없음"], isMultipleSelect: false)
    }
}
