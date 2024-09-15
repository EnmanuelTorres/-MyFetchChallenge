//
//  HomeFactory.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 6/09/24.
//

import Foundation


class HomeFactory {
    
    static func create() -> HomeView {
        HomeView(viewModel: createViewModel())
    }
    
    private static func createViewModel() -> HomeViewModel {
       HomeViewModel(repository: createRepository())
    }
    
    private static func createRepository() -> DessertListRepositoryType {
        DessertListRepository(apiDatasource: createDataSource(),
                              mealMapper: MealMapper(),
                              cacheDatasource: createCacheDataSource())
    }
    
    private static func createCacheDataSource() -> CacheDessertListType {
        CacheDessertList()
    }
    
    private static func createDataSource() -> ApiDatasourceDessertType {
        let httpClient = URLSessionHTTPClient(requestMaker: URLSessionRequestMaker())
        return APIMealDataSource(httpClient: httpClient)
    }
    
}
