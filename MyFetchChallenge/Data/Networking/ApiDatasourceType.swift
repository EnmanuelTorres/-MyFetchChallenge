//
//  ApiDatasourceType.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 5/09/24.
//

import Foundation

protocol ApiDatasourceDessertType {
    func getDessertList() async -> Result<[MealDTO], DataError>
}

protocol ApiDatasourceDetailMealType {
    func getDessertListSearched(id: String) async -> Result<DetailMealModel, DataError>
}
