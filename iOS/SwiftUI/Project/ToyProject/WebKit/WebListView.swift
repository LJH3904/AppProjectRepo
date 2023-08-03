//
//  WebListView.swift
//  Lab13
//
//  Created by LJh on 2023/08/03.
//

import SwiftUI


struct WebListView: View {
  @ObservedObject var webStore : WebStore = WebStore()
  @State var isShowingSheet : Bool = false
  @State var isShowingWebSheet : Bool = false
  @State var url : String = ""
  @State var index : Int = 0
    var body: some View {
      NavigationStack {
        VStack {
          List{
            ForEach(webStore.webDatas){ data in
                NavigationLink {
                  WebSheet(urlString: data.urlString)
                } label: {
                  whgdkdy(w: data)
                }
            }.onDelete(perform: webStore.deleteItems)
              .onMove(perform: webStore.moveItems)
          }.listStyle(.sidebar)
          Button {
            isShowingSheet.toggle()
          } label: {
            Text("추가")
          }
        }.navigationTitle("Web List")
        
      }// :navistack
      .sheet(isPresented: $isShowingSheet) {
        AddView(webStore: webStore,isShowingSheet: $isShowingSheet)
      }
//      .sheet(isPresented:$isShowingWebSheet ){
//        WebSheet(urlString: url)
//      }
      .onAppear(){
        
        webStore.fetchWebDatas()
      }
    }
}

struct whgdkdy :View {
  var w : Web
  var body: some View{
    HStack {
      AsyncImage(url: URL(string: w.imageString)) { image in
        image
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width:40, height: 40)
          .clipShape(Circle())
      } placeholder: {
        Image(systemName: "photo.circle.fill")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 40)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
      Text("\(w.title)")
    }
  }
}

struct WebListView_Previews: PreviewProvider {
    static var previews: some View {
        WebListView()
    }
}
