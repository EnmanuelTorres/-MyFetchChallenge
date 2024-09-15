//
//  DetailMealModel.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 7/09/24.
//

import Foundation

struct DetailMealResponse: Codable {
    let meals: [DetailMealModel]
}


struct DetailMealModel: Identifiable, Codable {
    let id: String
    let name: String
    let instructions: String
    let ingredients: [String]
    let measurements: [String]
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case instructions = "strInstructions"
        case imageURL = "strMealThumb"
    }
    
    struct DynamicCodingKeys: CodingKey {
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        var intValue: Int?
        init?(intValue: Int) {
            return nil
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        instructions = try container.decode(String.self, forKey: .instructions)
        imageURL = try container.decode(String.self, forKey: .imageURL)
        
        var ingredients: [String] = []
        var measurements: [String] = []
        
        let dynamicContainer = try decoder.container(keyedBy: DynamicCodingKeys.self)
        
        for i in 1...20 {
            if let ingredientKey = DynamicCodingKeys(stringValue: "strIngredient\(i)"),
               let ingredient = try dynamicContainer.decodeIfPresent(String.self, forKey: ingredientKey),
               !ingredient.isEmpty {
                ingredients.append(ingredient)
            }
            if let measurementKey = DynamicCodingKeys(stringValue: "strMeasure\(i)"),
               let measurement = try dynamicContainer.decodeIfPresent(String.self, forKey: measurementKey),
               !measurement.isEmpty {
                measurements.append(measurement)
            }
        }
        
        self.ingredients = ingredients
        self.measurements = measurements
    }
    
    init(id: String, name: String, instructions: String, ingredients: [String], measurements: [String], imageURL: String) {
          self.id = id
          self.name = name
          self.instructions = instructions
          self.ingredients = ingredients
          self.measurements = measurements
          self.imageURL = imageURL
      }
}
