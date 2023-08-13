//
//  ContentView.swift
//  iOS_060_LeeJeHyeon
//
//  Created by LJh on 2023/08/13.
//

import SwiftUI
import SafariServices

struct ContentView: View {

  
  @ObservedObject var store : Store = Store()
  
  var body: some View {
    NavigationStack{
      VStack{
        List{
          Section(header: Text("방송국"), content: {
            ForEach(store.stationStore){ i in
                ItemRow(item: i)
            }
          })
          Section(header: Text("OTT"), content: {
            ForEach(store.ottStore){ i in
              ItemRow(item: i)
            }
          })
          Section(header: Text("Git"), content: {
            ItemRow(item: store.git)
          })
          
        }
      }// : VSTACK
      .navigationTitle("볼거리들")
    }// : NavigationStack
    
  }
}

struct ItemRow : View {
  
  @State var isShowingSheet : Bool = false
  var item : Model
  
  var body: some View{
    VStack {
      Button {
        isShowingSheet.toggle()
      } label: {
        Label("\(item.name)", systemImage: "tv")
      }

    }.sheet(isPresented: $isShowingSheet) {
      SafariView(url: item.url)
    }
    
  }
}



struct SafariView: UIViewControllerRepresentable {
  
    var url: URL
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let safariViewController = SFSafariViewController(url: url)
      
      return safariViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
