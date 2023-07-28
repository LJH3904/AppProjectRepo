//
//  MyView.swift
//  BucketMate
//
//  Created by 유하은 on 2023/07/27.
//

import SwiftUI

struct MyView: View {
    @ObservedObject var memberStore : MemberStore = MemberStore()
      
    var body: some View {
        VStack {
            HStack {
                NavigationLink(destination: ChatView(name: memberStore.memberStore[0].name)) {
                    Image(systemName: "message.fill")
                }
                
                NavigationLink(destination: MySettingView()) {
                    Image(systemName: "gearshape.fill")
                }
            }
            .padding(.leading, 300)
            .foregroundColor(.buttonColor)
            Image("my")
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}
