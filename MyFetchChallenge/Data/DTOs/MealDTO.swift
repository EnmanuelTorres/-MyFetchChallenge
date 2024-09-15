//
//  MealDTO.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 5/09/24.
//

import Foundation

struct MealResponseDTO: Codable {
    let desserts: [MealDTO]
    
    enum CodingKeys: String, CodingKey {
        case desserts = "meals"
    }
    
}

struct MealDTO: Codable{
    let id: String
    let name: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case image = "strMealThumb"
    }
}
