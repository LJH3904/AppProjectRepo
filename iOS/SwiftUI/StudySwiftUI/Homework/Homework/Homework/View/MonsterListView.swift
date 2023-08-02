//
//  MonsterListView.swift
//  Homework
//
//  Created by LJh on 2023/07/17.
//

import SwiftUI

struct MonsterListView: View {
  var monsterStore : MonsterStore
  @Binding var isShowingSheet : Bool
  var body: some View {
    
    //MARK: - 리스트 뷰

    List{
      ForEach(monsterStore.monsterStore) { index in
       
          Button {
            monsterStore.addMonster(monster: index)
            isShowingSheet = false
          } label: {
            //그림을 눌러도 넘어감
            HStack{
              AsyncImage(url: index.locationURL) { image in
                image
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 40, height: 40)
                  .clipShape(Circle())
              } placeholder: {
                Image(systemName: "photo.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 40)
                    .foregroundColor(.purple)
                    .opacity(0.5)
              }
              Text("\(index.name)")
                .foregroundColor(.black)
            }
          }
          
          
        
      }
      
    }
  }
}

struct MonsterListView_Previews: PreviewProvider {
  static var previews: some View {
    MonsterListView(monsterStore: MonsterStore(), isShowingSheet: .constant(true))
  }
}
