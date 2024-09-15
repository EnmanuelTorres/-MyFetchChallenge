//
//  CacheDatasourceStub.swift
//  MyFetchChallengeTests
//
//  Created by ENMANUEL TORRES on 14/09/24.
//

import Foundation
@testable import MyFetchChallenge

class CacheDatasourceStub: CacheDessertListType {
    
    private let getMealList: [Meal]
    var cachedMealList: [Meal]?
    
    init(getMealList: [Meal]) {
        self.getMealList = getMealList
    }
    
    
    func getDessertList() async -> [Meal] {
        getMealList
    }
    
    func saveDessertList(_ dessertList: [Meal]) async {
        cachedMealList = dessertList
    }
    
}
