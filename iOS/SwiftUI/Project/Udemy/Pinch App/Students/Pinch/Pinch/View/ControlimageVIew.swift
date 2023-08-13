//
//  ControlimageVIew.swift
//  Pinch
//
//  Created by LJh on 2023/08/11.
//

import SwiftUI

struct ControlimageVIew: View {
  let icon : String
  var body: some View {
        Image(systemName: icon)
        .font(.system(size: 36))
    }
}

struct ControlimageVIew_Previews: PreviewProvider {
    static var previews: some View {
        ControlimageVIew(icon: "minus.magnifyingglass")
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
        .padding()
      
    }
}
