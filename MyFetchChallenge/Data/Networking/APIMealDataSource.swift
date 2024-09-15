//
//  APIMealDataSource.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 6/09/24.
//

import Foundation

class APIMealDataSource {
    
    private let httpClient : HTTPClient
    private let baseUrl = "https://themealdb.com/api/json/v1/1"
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
}

extension APIMealDataSource: ApiDatasourceDessertType {
    func getDessertList() async -> Result<[MealDTO], DataError> {
        let endpoint = "/filter.php?c=Dessert"
        
        let result = await httpClient.makeRequest(endpoint: endpoint, baseUrl: baseUrl)
        
       
        guard case .success(let data) = result else {
            return .failure(.dataError)
        }
        
        guard let dessertList = try? JSONDecoder().decode(MealResponseDTO.self, from: data) else {
            return .failure(.decodingError)
        }
        
       
        return .success(dessertList.desserts.sorted { $0.name < $1.name })
    }
}

extension APIMealDataSource: ApiDatasourceDetailMealType {
    func getDessertListSearched(id: String) async -> Result<DetailMealModel, DataError> {
        let endPoint = "/lookup.php?i=\(id)"
        
        let result = await httpClient.makeRequest(endpoint: endPoint, baseUrl: baseUrl)
        
        guard case .success(let data) = result else {
            return .failure(.dataError)
        }
        
        guard let decodedResponse = try? JSONDecoder().decode(DetailMealResponse.self, from: data) else {
            return .failure(.decodingError)
        }
        
       
        return .success(decodedResponse.meals[0])
        
    }
    
    
}
