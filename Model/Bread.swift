//
//  Bread.swift
//  TheCatBreadAPI
//
//  Created by divya bisen on 20/01/22.
//

import Foundation
import SwiftUI

struct BreedN: Codable {
    var result = [Breed]()
}

struct Breed: Codable, Identifiable {
    let explaination: String
    let energyLevel: Int
    let id: String
    let name: String
    let temperament: String
    let image: BreedImage?

    enum CodingKeys: String, CodingKey {
        case explaination = "description"
        case energyLevel = "energy_level"
        case name
        case id
        case temperament
        case image
    }
    
    static func example1() -> Breed {
        return Breed(explaination: "TEst Explanitin ", energyLevel: 1, id: "tsstes", name: "Test Name", temperament: "high", image: BreedImage(height: 100, id: "i", url: "https://cdn2.thecatapi.com/images/unX21IBVB.jpg", width: 100))
        
    }
    
}

struct Image: Codable {
    let height: Int?
    let id: String?
    let url: String?
    let width: Int?
}
