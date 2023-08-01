//
//  DesignExtension.swift
//  HomeWork3
//
//  Created by LJh on 2023/08/01.
//

import Foundation
import SwiftUI

extension Button{
   func SetCountViewButtonDesign() -> some View {
    self
      .padding()
      .frame(width: 300,height: 300)
  }
}
extension Text{
  func SetCountViewTextDesign() -> some View {
    self
      .font(.largeTitle)
      .bold()
      .foregroundColor(.white)
  }
}
