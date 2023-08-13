//
//  PageModel.swift
//  Pinch
//
//  Created by LJh on 2023/08/13.
//

import Foundation

struct Page : Identifiable {
  let id: Int
  let imageName : String
  
}

extension Page {
  var thumbnailName : String {
    return "thumb-" + imageName
  }
}
