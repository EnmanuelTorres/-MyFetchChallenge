//
//  CacheDessertListType.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 14/09/24.
//

import Foundation

protocol CacheDessertListType {
    func getDessertList() async -> [Meal]
    func saveDessertList(_ dessertList: [Meal]) async
}
