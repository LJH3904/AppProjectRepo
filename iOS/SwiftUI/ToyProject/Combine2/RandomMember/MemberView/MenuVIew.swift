//
//  MenuVIew.swift
//  RandomMember
//
//  Created by LJh on 2023/07/06.
//

import SwiftUI

struct MenuVIew: View {
    var body: some View {
      NavigationStack{
        List{
          NavigationLink {
            
            ContentView()
            
          } label: {
            Text("제비뽑기")
          }

        }
      }
    }
}

struct MenuVIew_Previews: PreviewProvider {
    static var previews: some View {
        MenuVIew()
    }
}
