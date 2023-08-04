//
//  SettingView.swift
//  HikeApp
//
//  Created by LJh on 2023/08/05.
//

import SwiftUI

struct SettingView: View {
  //MARK: - 속성들
  private let alternateAppIcons: [String] = [
    "AppIcon-Backpack",
    "AppIcon-Camera",
    "AppIcon-Campfire",
    "AppIcon-MagnifyingGlass",
    "AppIcon-Map",
    "AppIcon-Mushroom"

  ]

    var body: some View {
      List{
        //MARK: - Section : Header
        Section{
          HStack {
            Spacer()
            
            Image(systemName: "laurel.leading")
              .font(.system(size: 80,weight: .black))
            
            VStack(spacing : -10) {
              Text("Hike")
                .font(.system(size: 66,weight: .black))
              Text("Editors' Choice")
                .fontWeight(.medium)
            }
            Image(systemName: "laurel.trailing")
              .font(.system(size: 80,weight: .black))
            Spacer()
            
          }.foregroundStyle(
            LinearGradient(colors : [
              .customGreenLight,
              .customGreenMedium,
              .customGreenDark],
                           startPoint: .top,
                           endPoint: .bottom
            )
          )
          .padding(.top,8)
          VStack(spacing:8){
            Text("Where can you find \nperfect tracks?")
              .font(.title2)
              .fontWeight(.heavy)
            
            Text("Do you love the rain? Does it make you dance\nWhen you're drunk with your friends at a party?\nWhat's your favorite song, does it make you smile?\nDo you think of me?")
              .font(.footnote)
              .italic()
            
            Text("I'd spend ten thousand hours and ten thousand more\nOh, if that's what it takes to learn that sweet heart of yours")
              .fontWeight(.heavy)
              .foregroundColor(.customGreenLight)
          }
          .multilineTextAlignment(.center)
          .padding(.bottom,16)
          .frame(maxWidth: .infinity)
        }//: Header
        .listRowSeparator(.hidden)
        //MARK: - Section : Icons
        
        Section(header: Text("Alternate Icons")) {
          ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing:12) {
              ForEach(alternateAppIcons.indices, id: \.self){ item in
              Button {
                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]){ error in
                  if error != nil {
                    print("Failed request to update the app's icon:\(String(describing: error?.localizedDescription))")
                  }else{
                    print("Success! You Have changed the app;s icon to \(alternateAppIcons[item])")
                  }
                }
              } label: {
                Image("\(alternateAppIcons[item])-Preview")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 80,height: 80)
                  .cornerRadius(16)
                  .padding(.bottom,12)
              }
              .buttonStyle(.borderless)
              }
            }
          }//:SCROLL VIEW
          .padding(.top,12)
          Text("너가 좋아하는 아이콘을 골라봐")
            .frame(minWidth: 0,maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .foregroundColor(.secondary)
            .font(.footnote)
        }
        .listSectionSeparator(.hidden)
        
        //MARK: - Section : About
        Section(
          header: Text("About The App"),
          footer: HStack{
            Spacer()
            Text("CopyLight @ All right reserved.")
            Spacer()
          }
            .padding(.vertical,8)
        ){
          // 1. Basic Labeled Content
//          LabeledContent("Application", value: "Hike")
          
          // 2. Advanced Labeled Content
          CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
          
          CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS,iPadOS", rowTintColor: .red)
          
          CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
          
          CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
          CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "LJH", rowTintColor: .mint)
          
          CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "LJS", rowTintColor: .pink)

          CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Credo Acedemy", rowLinkDestination: "https://credo.academy")
          CustomListRowView(rowLabel: "MyGit", rowIcon: "rosette", rowTintColor: .teal, rowLinkLabel: "Git", rowLinkDestination: "https://github.com/LJH3904")

        }//:Section

      }// : List
    
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
