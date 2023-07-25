//
//  Car.swift
//  ListNavDemo
//
//  Created by LJh on 2023/07/25.
//

import SwiftUI

struct Car : Identifiable , Codable{
    
    var id: String
    var name : String
    
    var description : String
    var isHybrid : Bool
    
    var selectedCarHybridImage : String {
        get{
            return isHybrid ? "checkmark.circle" : "xmark.circle"
        }
    }
    var imageName : String
    var isFavorite: Bool
}
