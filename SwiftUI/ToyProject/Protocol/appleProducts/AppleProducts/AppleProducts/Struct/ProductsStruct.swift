//
//  productsStruct.swift
//  AppleProducts
//
//  Created by 전민석 on 2023/07/04.
//

import Foundation

struct iPhone: productProtocol {
    var id: UUID = UUID()
    var name: String
    var year: String
    var osVersion: Double
    var price: Int
    var image: String
    var appleTVPlusCompatible: Bool
    
    var cameraPixel: Int
}

struct iPad: productProtocol {
    var id: UUID = UUID()
    var name: String
    var year: String
    var osVersion: Double
    var price: Int
    var image: String
    var appleTVPlusCompatible: Bool
    
    var cameraPixel: Int
}

struct Mac: productProtocol {
    var id: UUID = UUID()
    var name: String
    var year: String
    var osVersion: Double
    var price: Int
    var image: String
    var appleTVPlusCompatible: Bool
    
    var cameraPixel: Int
}

struct AppleWatch: productProtocol {
    var id: UUID = UUID()
    var name: String
    var year: String
    var osVersion: Double
    var price: Int
    var image: String
    var appleTVPlusCompatible: Bool
    
    var sensor: String
}

struct AppleTV: productProtocol {
    var id: UUID = UUID()
    var name: String
    var year: String
    var osVersion: Double
    var price: Int
    var image: String
    var appleTVPlusCompatible: Bool
}
