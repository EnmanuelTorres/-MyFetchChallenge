//
//  CacheDessertList.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 14/09/24.
//

import Foundation

class CacheDessertList: CacheDessertListType {
    
    private let dessertListKey = "dessertList"
    
    func getDessertList() async -> [Meal] {
        if let data = UserDefaults.standard.data(forKey: dessertListKey) {
            let decoder = JSONDecoder()
            if let dessertList = try? decoder.decode([Meal].self, from: data) {
                return dessertList
            }
        }
        return []
    }
    
    func saveDessertList(_ dessertList: [Meal]) async {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(dessertList) {
            UserDefaults.standard.setValue(data, forKey: dessertListKey)
        }
    }
    
    
}
