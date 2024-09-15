//
//  DetailMealFactory.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 7/09/24.
//

import Foundation

class DetailMealFactory {
    
    static func create(id: String) -> DetailMealView {
        DetailMealView(viewModel: createViewModel(), id: id)
    }
    
    private static func createViewModel() -> DetailMealViewModel {
        DetailMealViewModel(repository: createRepository())
    }
    
    private static func createRepository() -> DetailMealRepositoryType {
        DetailMealRepository(apiDatasource: createDataSource())
    }
    
    private static func createDataSource() -> ApiDatasourceDetailMealType {
        let httpClient = URLSessionHTTPClient(requestMaker: URLSessionRequestMaker())
        return APIMealDataSource(httpClient: httpClient)
    }
}
