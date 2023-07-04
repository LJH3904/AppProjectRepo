//
//  productProtocol.swift
//  AppleProducts
//
//  Created by 전민석 on 2023/07/04.
//

import Foundation

protocol productProtocol: Identifiable {
    var name: String { get set }
    var year: String { get set }
    var image: String { get set }
    var osVersion: Double { get set }
    var price: Int { get set }
    var appleTVPlusCompatible: Bool { get set }
}
