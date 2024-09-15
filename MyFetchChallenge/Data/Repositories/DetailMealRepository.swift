//
//  DetailMealRepository.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 7/09/24.
//

import Foundation

protocol DetailMealRepositoryType {

    func getMealDetail(id: String) async -> Result<DetailMealModel, DataError>
}


class DetailMealRepository: DetailMealRepositoryType {
   
    
    private let apiDatasource: ApiDatasourceDetailMealType
    
    init(apiDatasource: ApiDatasourceDetailMealType){
        self.apiDatasource = apiDatasource
    }
    
    func getMealDetail(id: String) async -> Result<DetailMealModel, DataError> {
        
        
        let result =  await apiDatasource.getDessertListSearched(id: id)
        guard case .success(let mealInfo) = result else {
            return result
        }
        return .success(mealInfo)
    }
    
}
