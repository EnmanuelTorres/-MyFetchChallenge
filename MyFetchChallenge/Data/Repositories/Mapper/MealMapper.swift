//
//  MealMapper.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 5/09/24.
//

import Foundation

struct MealMapper {
    func map(mealListDTO: [MealDTO]) -> [Meal] {
        let mappedDesserts = mealListDTO.map {
            Meal(id: $0.id,
                    name: $0.name,
                    image: $0.image)
        }
        return mappedDesserts
    }
}
