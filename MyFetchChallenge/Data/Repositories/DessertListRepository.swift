//
//  DessertListRepository.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 5/09/24.
//

import Foundation

protocol DessertListRepositoryType {
    func getDessertList() async -> Result<[Meal], DataError>
}


class DessertListRepository: DessertListRepositoryType {
    
    private let mealMapper: MealMapper
    private let apiDatasource: ApiDatasourceDessertType
    private let cacheDatasource: CacheDessertListType
    
    init(apiDatasource: ApiDatasourceDessertType, mealMapper: MealMapper, cacheDatasource: CacheDessertListType){
        self.apiDatasource = apiDatasource
        self.mealMapper = mealMapper
        self.cacheDatasource = cacheDatasource
    }
    
    
    
    func getDessertList() async -> Result<[Meal], DataError> {
        
        
        let dessertListCache = await cacheDatasource.getDessertList()
        
        if !dessertListCache.isEmpty {
            return .success(dessertListCache)
        }
        
        
        let result:  Result<[MealDTO], DataError> =  await apiDatasource.getDessertList()
        guard case .success(let dessertList) = result else {
            return .failure(result.failureCase as! DataError)
        }
        let mappedDessertList = mealMapper.map(mealListDTO: dessertList)
        
        await cacheDatasource.saveDessertList(mappedDessertList)
        
        return .success(mappedDessertList)
    }
    
    
}
