//
//  AddView.swift
//  Lab13
//
//  Created by LJh on 2023/08/03.
//

import SwiftUI

struct AddView: View {
    var webStore : WebStore
    @State var titleText : String = ""
    @State var titleUrl: String = ""
    @Binding var isShowingSheet : Bool 
  
    var body: some View {
    
        Form{
            Section("title"){
              TextField("타이틀", text: $titleText)
            }
            Section("URL"){
              TextField("URL", text: $titleUrl)
            }
            Button {
              webStore.addItems(element: Web(
                title:  titleText,
                urlString: "Https://" + titleUrl, imageString: "https://cdn-icons-png.flaticon.com/512/2991/2991148.png"))
              isShowingSheet.toggle()
              
            } label: {
              Text("저장하기")
            }
            Button {
              isShowingSheet.toggle()
            } label: {
              Text("취소하기")
            }
          
          
        }
      
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
      AddView(webStore: WebStore(),isShowingSheet: .constant(true))
    }
}
